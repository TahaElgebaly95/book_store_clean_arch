// ========== get_category_products_use_case.dart ==========
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/repo/home_repo.dart';
import '../entities/product_entity.dart';

class GetCategoryProductsUseCase {
  final HomeRepository _repository;

  GetCategoryProductsUseCase(this._repository);

  Future<Either<Failure, List<ProductEntity>>> call(int categoryId) async {
    return await _repository.getCategoryProducts(categoryId);
  }
}