import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/cart_model.dart';
import '../../../data/repo/cart_repo.dart';
import '../../../domain/use_cases/fetch_cart_use_case.dart';

part 'fetch_cart_state.dart';

class FetchCartCubit extends Cubit<FetchCartState> {
  FetchCartCubit(this.cartRepo) : super(FetchCartInitialState());
  final CartRepo cartRepo;

  static FetchCartCubit get(context) => BlocProvider.of(context);

  Future<void> fetchCart() async {
    emit(FetchCartLoadingState());
    final result = await FetchCartUseCase(cartRepo).call();
    result.fold(
          (failure) => emit(FetchCartErrorState(failure.errMessage)),
          (cartModel) => emit(FetchCartSuccessState(cartModel)),
    );
  }

  // ✅ Method للتحقق من وجود المنتج في السلة
  bool isProductInCart(int productId) {
    final currentState = state;

    if (currentState is FetchCartSuccessState) {
      return currentState.cartModel.cartItems?.any(
            (cartItem) => cartItem.itemProductId == productId,
      ) ?? false;
    }

    return false;
  }

  // ✅ Method للحصول على cart item id من product id
  int? getCartItemId(int productId) {
    final currentState = state;

    if (currentState is FetchCartSuccessState) {
      final cartItem = currentState.cartModel.cartItems?.firstWhere(
            (item) => item.itemProductId == productId,
        orElse: () => CartItems(),
      );
      return cartItem?.itemId;
    }

    return null;
  }
}