import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/repo/auth_repo.dart';

class VerifyEmailUseCase {
  final AuthRepository repository;
  VerifyEmailUseCase(this.repository);

  Future<Either<Failure, void>> call({required String verifyCode}) async {
    return await repository.verifyEmail(verifyCode: verifyCode);
  }
}