import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/model/cart_model.dart';
import '../../data/repo/cart_repo.dart';

class UpdateCartUseCase {
  final CartRepo cartRepo;

  UpdateCartUseCase(this.cartRepo);

  // ✅ تغيير من productId إلى cartItemId
  Future<Either<Failure, CartItems>> call({
    required int cartItemId,
    required int quantity,
  }) async {
    return await cartRepo.updateCart(
      cartItemId: cartItemId,
      quantity: quantity,
    );
  }
}
