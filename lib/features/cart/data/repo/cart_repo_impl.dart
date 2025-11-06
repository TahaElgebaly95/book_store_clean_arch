import 'package:book_store_mvvm/core/errors/failures.dart';
import 'package:book_store_mvvm/features/cart/data/data_sources/update_cart_remote_data_source.dart';
import 'package:book_store_mvvm/features/cart/data/model/cart_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../data_sources/add_to_cart_remote_data_source.dart';
import '../data_sources/fetch_cart_remote_data_source.dart';
import '../data_sources/remove_from_cart_remote_data_source.dart';
import 'cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final FetchCartRemoteDataSource cartRemoteDataSource;
  final AddToCartRemoteDataSource addToCartRemoteDataSource;
  final RemoveFromCartRemoteDataSource removeFromCartRemoteDataSource;
  final UpdateCartRemoteDataSource updateCartRemoteDataSource;

  CartRepoImpl(
    this.cartRemoteDataSource,
    this.addToCartRemoteDataSource,
    this.removeFromCartRemoteDataSource,
    this.updateCartRemoteDataSource,
  );

  //************************************
  @override
  Future<Either<Failure, CartData>> fetchCart() async {
    try {
      final cart = await cartRemoteDataSource.fetchCart();
      return Right(cart);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  //************************************
  @override
  Future<Either<Failure, CartItems>> addToCart({required int productId}) async {
    try {
      final addToCart = await addToCartRemoteDataSource.addToCart(
        productId: productId,
      );
      return Right(addToCart);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  //************************************
  @override
  Future<Either<Failure, CartItems>> removeFromCart({
    required int cartItemId,
  }) async {
    try {
      final removeFromCart = await removeFromCartRemoteDataSource
          .removeFromCart(cartItemId: cartItemId);
      return Right(removeFromCart);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  //************************************
  @override
  Future<Either<Failure, CartItems>> updateCart({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      final result = await updateCartRemoteDataSource.updateQuantity(
        cartItemId: cartItemId,
        quantity: quantity,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure('Error updating quantity: ${e.toString()}'));
    }
  }
}
