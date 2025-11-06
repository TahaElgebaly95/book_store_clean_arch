import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/repo/profile_repo.dart';

class DeleteAccountUseCase {
  final ProfileRepo repo;
  DeleteAccountUseCase(this.repo);

  Future<Either<Failure, void>> call(String currentPassword) =>
      repo.deleteAccount(currentPassword);
}