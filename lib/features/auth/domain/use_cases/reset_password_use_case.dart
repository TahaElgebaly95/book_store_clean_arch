import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/repo/auth_repo.dart';

class ResetPasswordUseCase {
  final AuthRepository _repository;

  ResetPasswordUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async {
    return await _repository.resetPassword(
      code: code,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}