import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/repo/auth_repo.dart';

class ResendVerifyLinkUseCase {
  final AuthRepository _repository;

  ResendVerifyLinkUseCase(this._repository);

  Future<Either<Failure, void>> call() async {
    return await _repository.resendVerifyLink();
  }
}