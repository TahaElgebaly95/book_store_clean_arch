import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/model/user_model.dart';
import '../../data/repo/profile_repo.dart';

class GetProfileUseCase {
  final ProfileRepo repo;

  GetProfileUseCase(this.repo);

  Future<Either<Failure, UserModel>> call() => repo.getProfile();
}