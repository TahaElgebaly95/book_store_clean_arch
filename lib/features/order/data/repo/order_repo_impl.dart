import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../data/data_sources/checkout_remote_data_source.dart';
import '../../data/data_sources/order_history_remote_data_source.dart';
import '../../data/data_sources/place_order_remote_data_source.dart';
import '../../data/data_sources/show_single_order_remote_data_source.dart';
import '../../data/model/ckechout_model.dart';
import '../../data/repo/order_repo.dart';
import '../model/order_history_model.dart';
import '../model/show_single_order_model.dart';

class OrderRepoImpl extends OrderRepo {
  final CheckoutRemoteDataSource checkoutRemoteDataSource;
  final PlaceOrderRemoteDataSource placeOrderRemoteDataSource;
  final OrderHistoryRemoteDataSource orderHistoryRemoteDataSource;
  final ShowSingleOrderRemoteDataSource showSingleOrderRemoteDataSource;

  OrderRepoImpl({
    required this.checkoutRemoteDataSource,
    required this.placeOrderRemoteDataSource,
    required this.orderHistoryRemoteDataSource,
    required this.showSingleOrderRemoteDataSource,
  });

  @override
  Future<Either<Failure, CheckOutModel>> getCheckout() async {
    try {
      final checkout = await checkoutRemoteDataSource.getCheckout();
      return Right(checkout);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> placeOrder({
    required String address,
    required String phone,
    required String governorateId,
    required String name,
    required String email,
    String? paymentMethod,
  }) async {
    try {
      final order = await placeOrderRemoteDataSource.placeOrder(
        address: address,
        phone: phone,
        governorateId: governorateId,
        name: name,
        email: email,
        paymentMethod: paymentMethod,
      );
      return Right(order);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderHistoryModel>> getOrderHistory() async {
    try {
      final result = await orderHistoryRemoteDataSource.getOrderHistory();
      return result;
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShowSingleOrderModel>> showSingleOrder(
    int orderId,
  ) async {
    try {
      final result = await showSingleOrderRemoteDataSource.getOrderById(
        orderId,
      );
      return result;
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
