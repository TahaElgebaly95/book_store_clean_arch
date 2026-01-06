import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/cart_model.dart';
import '../../../domain/use_cases/add_to_cart_use_case.dart';
import '../../../domain/use_cases/remove_from_cart_use_case.dart';

part 'add_or_remove_to_cart_state.dart';

class AddOrRemoveToCartCubit extends Cubit<AddOrRemoveToCartState> {
  final AddToCartUseCase addToCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;

  final Set<int> _loadingProducts = {};

  AddOrRemoveToCartCubit(
      this.addToCartUseCase,
      this.removeFromCartUseCase,
      ) : super(AddOrRemoveToCartInitialState());

  static AddOrRemoveToCartCubit get(context) => BlocProvider.of(context);

  bool isProductLoading(int productId) => _loadingProducts.contains(productId);

  Future<void> addToCart({required int productId}) async {
    _loadingProducts.add(productId);
    emit(AddToCartLoadingState(productId));

    final result = await addToCartUseCase.call(productId: productId);

    _loadingProducts.remove(productId);

    result.fold(
          (failure) {
        emit(AddToCartErrorState(failure.errMessage));
      },
          (cartItem) {
        emit(AddToCartSuccessState(cartItem));
      },
    );
  }

  Future<void> removeFromCart({required int cartItemId}) async {
    _loadingProducts.add(cartItemId);
    emit(RemoveFromCartLoadingState(cartItemId));

    final result = await removeFromCartUseCase.call(cartItemId: cartItemId);

    _loadingProducts.remove(cartItemId);

    result.fold(
          (failure) {
        emit(RemoveFromCartErrorState(failure.errMessage));
      },
          (cartItem) {
        emit(RemoveFromCartSuccessState(cartItem));
      },
    );
  }
}