import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../model/all_products_books.dart';

abstract class AllProductsRepo {
  Future<Either<Failure, AllProductsBooksModel>> getAllProducts();
  Future<Either<Failure, ProductModel >> searchProducts(String name);
  Future<Either<Failure, ProductModel>> getProductDetails(int id);
}
