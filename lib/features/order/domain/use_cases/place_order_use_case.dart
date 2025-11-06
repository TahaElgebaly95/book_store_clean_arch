import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/repo/order_repo.dart';

class PlaceOrderUseCase {
  final OrderRepo orderRepo;

  PlaceOrderUseCase(this.orderRepo);

  Future<Either<Failure, Map<String, dynamic>>> call({
    required String address,
    required String phone,
    required String name,
    required String email,
    required String governorateId,
    String? paymentMethod,
  }) async {
    return await orderRepo.placeOrder(
      address: address,
      phone: phone,
      paymentMethod: paymentMethod, email: email, name: name,governorateId: governorateId,
    );
  }
}