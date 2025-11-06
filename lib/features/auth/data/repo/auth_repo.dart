import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entity/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthEntity>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });

  Future<Either<Failure, void>> sendForgotPasswordLink({required String email});
  Future<Either<Failure, void>> checkForgotPasswordCode({required String verifyCode});
  Future<Either<Failure, void>> resetPassword({
    required String code,
    required String password,
    required String passwordConfirmation,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> resendVerifyLink();
  Future<Either<Failure, void>> verifyEmail({required String verifyCode});
}
