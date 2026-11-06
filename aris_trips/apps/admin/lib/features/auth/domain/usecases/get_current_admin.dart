import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/admin_user.dart';
import '../repositories/auth_repository.dart';

@injectable
class GetCurrentAdmin {
  const GetCurrentAdmin(this._repository);

  final AuthRepository _repository;

  TaskEither<Failure, Option<AdminUser>> call() => _repository.currentAdmin();
}
