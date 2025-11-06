import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../datasources/change_password_remote_data_source.dart';
import '../datasources/delete_profile_remote_data_source.dart';
import '../datasources/show_profile_remote_data_source.dart';
import '../datasources/update_profile_remote_data_source.dart';
import '../model/user_model.dart';
import 'profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final GetProfileRemoteDataSource getProfileDataSource;
  final UpdateProfileRemoteDataSource updateProfileDataSource;
  final ChangePasswordRemoteDataSource changePasswordDataSource;
  final DeleteAccountRemoteDataSource deleteAccountDataSource;

  ProfileRepoImpl(
    this.getProfileDataSource,
    this.updateProfileDataSource,
    this.changePasswordDataSource,
    this.deleteAccountDataSource,
  );

  @override
  Future<Either<Failure, UserModel>> getProfile() async {
    try {
      final user = await getProfileDataSource.getUserProfile();
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String city,
    required String address,
  }) async {
    try {
      final user = await updateProfileDataSource.updateProfile(
        name: name,
        email: email,
        phone: phone,
        city: city,
        address: address,
      );
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    try {
      await changePasswordDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        newPasswordConfirmation: newPasswordConfirmation,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount(String currentPassword) async {
    try {
      await deleteAccountDataSource.deleteAccount(currentPassword);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
