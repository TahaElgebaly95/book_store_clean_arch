import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/repo/auth_repo.dart';

class CheckForgotPasswordCodeUseCase {
  final AuthRepository _repository;

  CheckForgotPasswordCodeUseCase(this._repository);

  Future<Either<Failure, void>> call({required String verifyCode}) async {
    return await _repository.checkForgotPasswordCode(verifyCode: verifyCode);
  }
}