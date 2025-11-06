import 'package:dartz/dartz.dart';
import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../../../../core/errors/failures.dart';
import '../model/all_products_books.dart';

abstract class SearchProductDataSource {
  final ApiService apiService;

  SearchProductDataSource(this.apiService);

  Future<Either<Failure, ProductModel>> searchProducts(String name);
}

class SearchProductDataSourceImpl extends SearchProductDataSource {
  SearchProductDataSourceImpl(super.apiService);

  @override
  Future<Either<Failure, ProductModel>> searchProducts(String name) async {
    try {
      final response = await ApiService.getData(
        endpoint: '${EndPoints.productsSearch}?name=$name',
      );
      final product = ProductModel.fromJson(response.data['data']['product']);
      return Right(product);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
