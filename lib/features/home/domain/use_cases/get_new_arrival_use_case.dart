// ========== get_new_arrivals_use_case.dart ==========
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/repo/home_repo.dart';
import '../entities/product_entity.dart';

class GetNewArrivalsUseCase {
  final HomeRepository _repository;

  GetNewArrivalsUseCase(this._repository);

  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await _repository.getNewArrivals();
  }
}