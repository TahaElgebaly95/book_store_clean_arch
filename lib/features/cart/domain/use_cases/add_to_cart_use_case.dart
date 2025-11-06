import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/model/cart_model.dart';
import '../../data/repo/cart_repo.dart';

class AddToCartUseCase {
  final CartRepo repository;

  AddToCartUseCase(this.repository);

  Future<Either<Failure, CartItems>> call({required int productId}) async {
    return await repository.addToCart(productId: productId);
  }
}
