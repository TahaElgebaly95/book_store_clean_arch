import 'package:book_store_mvvm/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../model/show_single_order_model.dart';

abstract class ShowSingleOrderRemoteDataSource {
  final ApiService apiService;

  const ShowSingleOrderRemoteDataSource(this.apiService);

  Future<Either<Failure, ShowSingleOrderModel>> getOrderById(int orderId);
}

class ShowSingleOrderRemoteDataSourceImpl
    extends ShowSingleOrderRemoteDataSource {
  const ShowSingleOrderRemoteDataSourceImpl(super.apiService);

  @override
  Future<Either<Failure, ShowSingleOrderModel>> getOrderById(
    int orderId,
  ) async {
    try {
      final response = await ApiService.getData(
        endpoint: '${EndPoints.orderHistory}/$orderId',
        withToken: true,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(ShowSingleOrderModel.fromJson(response.data));
      } else {
        throw Exception('Failed to get order: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting order: $e');
    }
  }
}
