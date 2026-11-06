import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/admin_user.dart';

abstract interface class AuthRepository {
  /// Signs in and confirms the account is an admin. A non-admin account is
  /// signed out again and yields [Failure.notAdmin].
  TaskEither<Failure, AdminUser> signIn({
    required String email,
    required String password,
  });

  /// Ends the session on this device.
  TaskEither<Failure, Unit> signOut();

  /// The admin of the persisted session, or [none] when there is no session
  /// or the account is no longer an admin (its session is then closed).
  TaskEither<Failure, Option<AdminUser>> currentAdmin();

  /// Emits whenever the session ends, e.g. when the refresh token expires.
  Stream<Unit> signedOutChanges();
}
