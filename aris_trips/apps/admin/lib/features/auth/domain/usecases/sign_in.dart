import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/admin_user.dart';
import '../repositories/auth_repository.dart';

@injectable
class SignIn {
  const SignIn(this._repository);

  final AuthRepository _repository;

  TaskEither<Failure, AdminUser> call({
    required String email,
    required String password,
  }) =>
      _repository.signIn(email: email.trim().toLowerCase(), password: password);
}
