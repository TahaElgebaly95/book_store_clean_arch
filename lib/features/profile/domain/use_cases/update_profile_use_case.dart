import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/model/user_model.dart';
import '../../data/repo/profile_repo.dart';

class UpdateProfileUseCase {
  final ProfileRepo repo;

  UpdateProfileUseCase(this.repo);

  Future<Either<Failure, UserModel>> call({
    required String name,
    required String email,
    required String phone,
    required String city,
    required String address,
  }) =>
      repo.updateProfile(
        name: name,
        email: email,
        phone: phone,
        city: city,
        address: address,
      );
}