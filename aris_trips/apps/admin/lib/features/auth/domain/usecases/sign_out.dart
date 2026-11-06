import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

@injectable
class SignOut {
  const SignOut(this._repository);

  final AuthRepository _repository;

  TaskEither<Failure, Unit> call() => _repository.signOut();
}
