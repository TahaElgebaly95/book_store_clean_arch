import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../model/ckechout_model.dart';
import '../model/order_history_model.dart';
import '../model/show_single_order_model.dart';

abstract class OrderRepo {
  Future<Either<Failure, CheckOutModel>> getCheckout();

  Future<Either<Failure, Map<String, dynamic>>> placeOrder({
    required String name,
    required String phone,
    required String governorateId,
    required String address,
    required String email,

    String? paymentMethod,
  });

  Future<Either<Failure, OrderHistoryModel>> getOrderHistory();

  Future<Either<Failure, ShowSingleOrderModel>> showSingleOrder(int orderId);
}
