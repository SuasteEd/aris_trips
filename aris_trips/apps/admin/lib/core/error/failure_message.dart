import 'failure.dart';

/// User-facing text (es-MX) for each [Failure].
extension FailureMessage on Failure {
  String get message => switch (this) {
    NetworkFailure() =>
      'Sin conexión. Revisa tu internet e inténtalo de nuevo.',
    UnauthorizedFailure() => 'Tu sesión terminó. Inicia sesión de nuevo.',
    InvalidCredentialsFailure() => 'Correo o contraseña incorrectos.',
    NotAdminFailure() => 'Esta cuenta no tiene acceso de administrador.',
    NotFoundFailure() => 'No encontramos lo que buscas.',
    ServerFailure() ||
    UnexpectedFailure() => 'Ocurrió un error. Inténtalo de nuevo.',
  };
}
