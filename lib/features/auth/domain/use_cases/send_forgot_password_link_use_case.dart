import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/repo/auth_repo.dart';

class SendForgotPasswordLinkUseCase {
  final AuthRepository _repository;

  SendForgotPasswordLinkUseCase(this._repository);

  Future<Either<Failure, void>> call({required String email}) async {
    return await _repository.sendForgotPasswordLink(email: email);
  }
}