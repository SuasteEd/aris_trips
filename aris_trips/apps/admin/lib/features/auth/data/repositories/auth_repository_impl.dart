import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/admin_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import 'auth_failure_mapper.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remote);

  final AuthRemoteDataSource _remote;

  @override
  TaskEither<Failure, AdminUser> signIn({
    required String email,
    required String password,
  }) => TaskEither.tryCatch(
    () => _remote.signIn(email: email, password: password),
    (error, _) => mapAuthException(error),
  );

  @override
  TaskEither<Failure, Unit> signOut() => TaskEither.tryCatch(() async {
    await _remote.signOut();
    return unit;
  }, (error, _) => mapAuthException(error));

  @override
  TaskEither<Failure, Option<AdminUser>> currentAdmin() => TaskEither.tryCatch(
    () async => Option.fromNullable(await _remote.currentAdmin()),
    (error, _) => mapAuthException(error),
  );

  @override
  Stream<Unit> signedOutChanges() =>
      _remote.signedOutChanges().map((_) => unit);
}
