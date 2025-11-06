import 'package:book_store_mvvm/core/errors/failures.dart';
import 'package:book_store_mvvm/features/books/data/model/all_products_books.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../data_sources/all_products_remote_data_source.dart';
import '../data_sources/search_product_data_source.dart';
import '../data_sources/show_product_details_remote_data_source.dart';
import 'all_products_repo.dart';

class AllProductsRepoImpl extends AllProductsRepo {
  final AllProductsRemoteDataSource allProductsRemoteDataSource;
  final SearchProductDataSource searchProductDataSource;
  final ShowProductDetailsRemoteDataSource showProductDetailsRemoteDataSource;

  AllProductsRepoImpl(
    this.allProductsRemoteDataSource,
    this.searchProductDataSource,
    this.showProductDetailsRemoteDataSource,
  );

  @override
  Future<Either<Failure, AllProductsBooksModel>> getAllProducts() async {
    try {
      final allProductsBooks =
          await allProductsRemoteDataSource.getAllProducts();
      return allProductsBooks;
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> searchProducts(String name) async {
    try {
      final product = await searchProductDataSource.searchProducts(name);
      return product;
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductDetails(int id) async {
    try {
      final productById = await showProductDetailsRemoteDataSource
          .getProductDetails(id);
      return productById;
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
