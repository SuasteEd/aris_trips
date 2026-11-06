# Sistema de viajes

Sistema para que una agencia administre viajes y sus pasajeros consulten vuelos, hotel, itinerario y promociones de próximos viajes.

- **App admin:** Flutter, solo Android. Es el proyecto actual.
- **WebApp del viajero:** Next.js como PWA. Se construirá después; no crear código web todavía.
- **Backend:** Supabase (Postgres, Auth y Storage), compartido por ambos clientes.

## Reglas para trabajar

- Identificadores de código, base de datos y commits en inglés.
- Textos de la interfaz en español de México. Documentación en español.
- Trabaja un hito a la vez y detente al terminarlo para que yo lo revise.
- Antes de un hito, presenta un plan breve. Pregunta solo si una decisión cambia el modelo de datos o la seguridad.
- Haz commits pequeños con Conventional Commits. No hagas push.
- No agregues funciones fuera del hito actual ni dependencias sin justificarlas.
- Un hito está terminado cuando pasan `flutter analyze`, `flutter test` y `supabase/scripts/test-db.sh` (pgTAP contra el proyecto vinculado, sin Docker).

## Estructura del repositorio

```text
.
├── CLAUDE.md
├── apps/
│   ├── admin/              # App Flutter
│   └── web/                # Reservado para Next.js; no tocar
└── supabase/
    ├── config.toml
    ├── migrations/
    ├── scripts/            # test-db.sh: corre pgTAP sin Docker
    ├── seed.sql
    └── tests/              # Pruebas pgTAP
```

## Stack de la app

- Flutter y Dart estables, con `supabase_flutter`.
- Clean Architecture por feature.
- BLoC/Cubit con `flutter_bloc`.
- `go_router` para navegación.
- `get_it` + `injectable` para inyección de dependencias.
- `freezed` y `json_serializable` para modelos y estados.
- `fpdart` para errores: los repositorios devuelven `TaskEither<Failure, T>`.
- `bloc_test` y `mocktail` para pruebas.

```text
apps/admin/lib/
├── core/                   # config, di, error, router, theme, widgets
└── features/
    └── <feature>/
        ├── data/           # datasources, models, repositorios
        ├── domain/         # entidades, contratos, casos de uso
        └── presentation/   # blocs/cubits, pages, widgets
```

Reglas de arquitectura:

- `domain` no importa Flutter, Supabase ni nada de `data`.
- Solo `data` usa el cliente de Supabase.
- Las excepciones se convierten en `Failure` dentro de `data`.
- Los widgets no contienen reglas de negocio.
- Los estados cubren carga, éxito, vacío y error.
- Colores, tipografía y espacios salen de tokens en `core/theme`.

## Modelo de datos

Una reservación (`bookings`) une a un pasajero con un viaje y es la unidad de acceso. Un viaje individual es un viaje con una sola reservación.

| Tabla | Campos principales |
| --- | --- |
| `admins` | `user_id` (FK a `auth.users`), `full_name`, `created_at` |
| `trips` | `name`, `destination`, `description`, `cover_path`, `start_date`, `end_date`, `status` (`draft`, `published`, `archived`) |
| `passengers` | `first_name`, `last_name`, `email`, `phone` |
| `bookings` | `trip_id`, `passenger_id`, `status`, `token_hash`, `code_hash`, `access_expires_at`, `access_revoked_at`, `notes` |
| `flights` | `trip_id`, `airline`, `flight_number`, `origin`, `destination`, `departs_at`, `departure_tz`, `arrives_at`, `arrival_tz`, `terminal` |
| `lodgings` | `trip_id`, `name`, `address`, `latitude`, `longitude`, `check_in_at`, `check_out_at`, `timezone` |
| `flight_assignments` | `booking_id`, `flight_id`, `seat`, `record_locator` |
| `lodging_assignments` | `booking_id`, `lodging_id`, `room`, `confirmation_number` |
| `itinerary_items` | `trip_id`, `booking_id` (nullable), `starts_at`, `ends_at`, `timezone`, `title`, `description`, `location` |
| `documents` | `trip_id`, `booking_id` (nullable), `title`, `kind`, `storage_path` |
| `promotions` | `title`, `description`, `image_path`, `destination`, `starts_on`, `ends_on`, `price_from`, `currency`, `whatsapp_url`, `status`, `published_at`, `expires_at` |
| `access_events` | `booking_id`, `event_type`, `created_at`, `metadata` |

Reglas del modelo:

- Todas las tablas usan `id uuid`; las de negocio llevan `created_at` y `updated_at`.
- `UNIQUE (trip_id, passenger_id)` en `bookings`.
- `UNIQUE (booking_id, flight_id)` en `flight_assignments`.
- `UNIQUE (booking_id, lodging_id)` en `lodging_assignments`.
- Una asignación solo acepta vuelos u hospedajes del mismo viaje que la reservación. Valídalo en la base.
- `booking_id` vacío en `itinerary_items` significa que aplica a todo el grupo.
- Cada fecha y hora se guarda como `timestamptz` junto con una zona horaria IANA. La interfaz muestra la hora local del lugar.
- Dinero con `numeric(12,2)` y moneda ISO 4217, nunca `double`.
- No guardar pasaporte, fecha de nacimiento ni datos de pago.

## Seguridad

- La app usa solo la llave pública de Supabase. La `service_role` nunca entra al repositorio ni a la app.
- RLS activo en todas las tablas, sin excepción.
- Los admins se crean por seed o desde el panel de Supabase. El registro público está desactivado.
- Crear `public.is_admin()` como `SECURITY DEFINER` con `search_path` fijo, y usarla en las políticas.
- Solo un admin lee y escribe datos privados.
- `anon` únicamente lee promociones publicadas y vigentes.
- Bucket `public-media` para portadas e imágenes de promociones. Solo los admins escriben.
- Bucket privado `documents`. Solo los admins acceden desde la app.

### Acceso del viajero

La webApp validará el enlace en su servidor. La app admin solo emite y revoca credenciales:

- `issue_booking_access(p_booking_id uuid)` genera un token aleatorio de 32 bytes en base64url y un código de 8 caracteres sin caracteres ambiguos.
- La función guarda solo hashes SHA-256, invalida las credenciales anteriores, registra el evento en `access_events` y devuelve el token y el código una sola vez.
- `revoke_booking_access(p_booking_id uuid)` marca la revocación y registra el evento.
- Ambas funciones son `SECURITY DEFINER`, tienen `search_path` fijo, exigen `is_admin()` y revocan `EXECUTE` a `public` y `anon`.
- `access_expires_at` usa por defecto `trips.end_date + 30 días`.
- La generación ocurre en la base, nunca en Dart.
- Los repositorios de la app no seleccionan `token_hash` ni `code_hash`.
- No registrar tokens ni códigos en logs.

El enlace compartido es `{WEB_BASE_URL}/v/{token}`.

## Configuración

Usa `--dart-define-from-file=.env`. `.env` queda fuera de Git y se incluye `.env.example`:

```env
SUPABASE_URL=http://10.0.2.2:54321
SUPABASE_ANON_KEY=
WEB_BASE_URL=http://localhost:3000
```

## Pantallas de la app

| Pantalla | Función |
| --- | --- |
| Inicio de sesión | Correo y contraseña del admin |
| Viajes | Lista por estado y fecha, con búsqueda |
| Detalle del viaje | Vuelos, hospedajes, itinerario, documentos y pasajeros |
| Pasajero | Asignaciones propias de vuelo, hotel, habitación y notas |
| Compartir | Generar, copiar, enviar por WhatsApp, regenerar o revocar el acceso |
| Importar pasajeros | Carga CSV con vista previa y errores por fila |
| Promociones | Crear, programar, publicar y retirar |

La vista "como pasajero" queda fuera hasta que exista la webApp.

## Hitos

1. **Base:** estructura del repositorio, migraciones, RLS, buckets, seed, pruebas pgTAP y proyecto Flutter con arquitectura, tema, DI y router.
2. **Autenticación:** inicio y cierre de sesión, persistencia y redirección. Un usuario que no sea admin no entra.
3. **Viajes:** lista, búsqueda, alta, edición, portada, estados y detalle.
4. **Logística:** vuelos, hospedajes e itinerario, con zonas horarias.
5. **Pasajeros:** alta, reservaciones, asignaciones individuales y masivas, e importación CSV.
6. **Compartir acceso:** emitir, mostrar una vez, copiar, enviar por WhatsApp, regenerar y revocar.
7. **Documentos:** subida al bucket privado, ligados al viaje o a una reservación.
8. **Promociones:** alta, imagen, vigencia y publicación.

## Fuera de alcance

Pagos, reservas en línea, notificaciones push, envíos automáticos, estatus de vuelo en tiempo real, iOS y roles avanzados.
