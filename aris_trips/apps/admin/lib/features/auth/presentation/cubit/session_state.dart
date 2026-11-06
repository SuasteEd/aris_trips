part of 'session_cubit.dart';

@freezed
sealed class SessionState with _$SessionState {
  /// Checking the stored session.
  const factory SessionState.unknown() = SessionUnknown;

  const factory SessionState.authenticated(AdminUser admin) =
      SessionAuthenticated;

  const factory SessionState.unauthenticated() = SessionUnauthenticated;

  /// The stored session could not be verified (e.g. offline).
  const factory SessionState.failure(Failure failure) = SessionFailure;
}
