import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/model/cart_model.dart';
import '../../data/repo/cart_repo.dart';

class RemoveFromCartUseCase {
  final CartRepo cartRepo;

  RemoveFromCartUseCase(this.cartRepo);

  Future<Either<Failure, CartItems>> call({required int cartItemId}) {
    return cartRepo.removeFromCart(cartItemId: cartItemId);
  }
}
