import 'package:dartz/dartz.dart';
import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../../../../core/errors/failures.dart';
import '../model/all_products_books.dart';

abstract class ShowProductDetailsRemoteDataSource {
  final ApiService apiService;

  ShowProductDetailsRemoteDataSource(this.apiService);

  Future<Either<Failure, ProductModel>> getProductDetails(int id);
}

class ShowProductDetailsRemoteDataSourceImpl
    extends ShowProductDetailsRemoteDataSource {
  ShowProductDetailsRemoteDataSourceImpl(super.apiService);

  @override
  Future<Either<Failure, ProductModel>> getProductDetails(int id) async {
    return ApiService.getData(
      endpoint: EndPoints.products + id.toString(),
    ).then((value) {
      if (value.statusCode == 200) {
        return Right(ProductModel.fromJson(value.data['data']['product']));
      } else {
        return Left(ServerFailure(value.data['message']));
      }
    });
  }
}
