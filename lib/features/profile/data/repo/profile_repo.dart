import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../model/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> getProfile();

  Future<Either<Failure, UserModel>> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String city,
    required String address,
  });

  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  });

  Future<Either<Failure, void>> deleteAccount(String currentPassword);
}