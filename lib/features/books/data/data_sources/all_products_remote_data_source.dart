import 'package:dartz/dartz.dart';
import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../../../../core/errors/failures.dart';
import '../model/all_products_books.dart';

abstract class AllProductsRemoteDataSource {
  final ApiService apiService;

  const AllProductsRemoteDataSource(this.apiService);

  Future<Either<Failure, AllProductsBooksModel>> getAllProducts();
}

class AllProductsRemoteDataSourceImpl extends AllProductsRemoteDataSource {
  AllProductsRemoteDataSourceImpl(super.apiService);

  @override
  Future<Either<Failure, AllProductsBooksModel>> getAllProducts() {
    return ApiService.getData(
      endpoint: EndPoints.products,
      withToken: true,
    ).then((response) {
      if (response.statusCode == 200) {
        return Right(AllProductsBooksModel.fromJson(response.data));
      } else {
        throw Exception('Failed to fetch all products');
      }
    });
  }
}
