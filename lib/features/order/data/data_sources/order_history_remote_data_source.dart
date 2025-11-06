import 'package:dartz/dartz.dart';

import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../../../../core/errors/failures.dart';
import '../model/order_history_model.dart';

abstract class OrderHistoryRemoteDataSource {
  final ApiService apiService;

  const OrderHistoryRemoteDataSource(this.apiService);

  Future<Either<Failure, OrderHistoryModel>> getOrderHistory();
}

class OrderHistoryRemoteDataSourceImpl extends OrderHistoryRemoteDataSource {
  const OrderHistoryRemoteDataSourceImpl(super.apiService);

  @override
  Future<Either<Failure, OrderHistoryModel>> getOrderHistory() async {
    try {
      final response = await ApiService.getData(
        endpoint: EndPoints.orderHistory,
        withToken: true,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(OrderHistoryModel.fromJson(response.data));
      } else {
        throw Exception('Failed to get order history: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting order history: $e');
    }
  }
}
