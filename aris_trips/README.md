# Aris Trips

Sistema para que una agencia administre viajes y sus pasajeros consulten su información. Las reglas del proyecto están en [CLAUDE.md](CLAUDE.md).

| Carpeta | Contenido |
| --- | --- |
| `apps/admin` | App Flutter (Android) para los admins |
| `apps/web` | Reservado para la webApp del viajero (Next.js) |
| `supabase` | Migraciones, seed y pruebas pgTAP |

## Base de datos (Supabase en la nube)

El desarrollo usa un proyecto de Supabase en la nube; no se requiere Docker.

```sh
supabase login
supabase link --project-ref <ref>
supabase db push --dry-run      # revisar
supabase db push --include-seed # aplicar migraciones y datos de ejemplo
supabase/scripts/test-db.sh     # pruebas pgTAP
```

`supabase test db` necesita Docker para ejecutar `pg_prove`, así que se usa `supabase/scripts/test-db.sh`. El script manda cada archivo de `supabase/tests` con `supabase db query --linked`, lo ejecuta dentro de una subtransacción que siempre se deshace (no deja datos) e imprime la salida TAP. Termina con código 1 si alguna prueba falla o si el número de pruebas no coincide con el plan. Para correr solo algunas pruebas, pasa los archivos como argumentos.

Configuración del proyecto en el panel:

1. **Authentication → Sign In / Providers:** desactivar "Allow new users to sign up" (o `supabase config push`, que aplica `enable_signup = false` de `config.toml`).
2. **Authentication → Users:** crear el usuario `admin@aristrips.dev` con una contraseña propia y volver a correr el seed para darlo de alta en `admins`. Para otros admins, insertar su `user_id` en `public.admins` desde el SQL Editor.

La llave `service_role` nunca se usa en la app ni se guarda en el repositorio.

## App admin

```sh
cd apps/admin
cp env.example.json env.json    # llenar SUPABASE_URL y SUPABASE_ANON_KEY (llave publishable)
flutter pub get
dart run build_runner build -d
flutter run --dart-define-from-file=env.json
```

Verificación:

```sh
flutter analyze
flutter test
```
