import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../model/cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, CartData>> fetchCart();

  Future<Either<Failure, CartItems>> addToCart({required int productId});

  Future<Either<Failure, CartItems>> removeFromCart({required int cartItemId});

  Future<Either<Failure, CartItems>> updateCart({
    required int cartItemId,
    required int quantity,
  });
}
