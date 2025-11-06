import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/repo/auth_repo.dart';

class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  Future<Either<Failure, void>> call() async {
    return await _repository.logout();
  }
}