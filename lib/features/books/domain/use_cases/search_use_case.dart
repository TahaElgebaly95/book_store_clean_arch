import 'package:book_store_mvvm/core/errors/failures.dart';
import 'package:book_store_mvvm/core/use_case/use_case.dart';
import 'package:book_store_mvvm/features/books/data/model/all_products_books.dart';
import 'package:dartz/dartz.dart';

import '../../data/repo/all_products_repo.dart';

class SearchProductUseCase extends UseCase<ProductModel, String> {
  final AllProductsRepo allProductsRepo;

  SearchProductUseCase(this.allProductsRepo);

  @override
  Future<Either<Failure, ProductModel>> call([String? params]) async {
    if (params == null || params.isEmpty) {
      return Left(ServerFailure("Product name cannot be empty."));
    }
    return await allProductsRepo.searchProducts(params);
  }
}
