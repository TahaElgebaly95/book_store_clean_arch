// ========== home_repository.dart ==========
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/silder_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<ProductEntity>>> getCategoryProducts(int categoryId);
  Future<Either<Failure, List<ProductEntity>>> getBestSellers();
  Future<Either<Failure, List<ProductEntity>>> getNewArrivals();
  Future<Either<Failure, List<SliderEntity>>> getSliders();
}