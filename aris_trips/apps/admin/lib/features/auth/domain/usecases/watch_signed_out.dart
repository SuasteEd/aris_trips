import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';

@injectable
class WatchSignedOut {
  const WatchSignedOut(this._repository);

  final AuthRepository _repository;

  Stream<Unit> call() => _repository.signedOutChanges();
}
