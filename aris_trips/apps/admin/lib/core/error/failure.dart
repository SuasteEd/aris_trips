import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Errors that cross the data layer boundary. Repositories convert every
/// exception into one of these and return `TaskEither<Failure, T>`.
@freezed
sealed class Failure with _$Failure {
  /// The server answered with an error (Postgres, PostgREST, Storage).
  const factory Failure.server({required String message, String? code}) =
      ServerFailure;

  /// No connection or timeout.
  const factory Failure.network() = NetworkFailure;

  /// Missing or expired session.
  const factory Failure.unauthorized() = UnauthorizedFailure;

  /// Wrong email or password.
  const factory Failure.invalidCredentials() = InvalidCredentialsFailure;

  /// Valid account without a row in `admins`.
  const factory Failure.notAdmin() = NotAdminFailure;

  /// Input rejected by domain validation before reaching the server.
  const factory Failure.invalidInput() = InvalidInputFailure;

  /// The requested record does not exist.
  const factory Failure.notFound() = NotFoundFailure;

  /// Anything not covered above.
  const factory Failure.unexpected({required String message}) =
      UnexpectedFailure;
}
