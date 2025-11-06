// ========== get_best_sellers_use_case.dart ==========
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/repo/home_repo.dart';
import '../entities/product_entity.dart';

class GetBestSellersUseCase {
  final HomeRepository _repository;

  GetBestSellersUseCase(this._repository);

  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await _repository.getBestSellers();
  }
}