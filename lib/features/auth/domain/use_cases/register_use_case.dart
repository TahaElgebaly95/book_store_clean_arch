import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/repo/auth_repo.dart';
import '../entity/auth_entity.dart';

class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  Future<Either<Failure, AuthEntity>> call({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    return await _repository.register(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
