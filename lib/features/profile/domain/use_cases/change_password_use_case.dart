import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/repo/profile_repo.dart';

class ChangePasswordUseCase {
  final ProfileRepo repo;

  ChangePasswordUseCase(this.repo);

  Future<Either<Failure, void>> call({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    if (newPassword != newPasswordConfirmation) {
      return Left(ServerFailure('Passwords do not match'));
    }
    return repo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword, newPasswordConfirmation: newPasswordConfirmation,
    );
  }
}