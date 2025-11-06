part of 'add_or_remove_to_cart_cubit.dart';

sealed class AddOrRemoveToCartState extends Equatable {
  const AddOrRemoveToCartState();

  @override
  List<Object?> get props => [];
}

final class AddOrRemoveToCartInitialState extends AddOrRemoveToCartState {}

// ✅ إضافة productId للـ Loading State
final class AddToCartLoadingState extends AddOrRemoveToCartState {
  final int productId;
  const AddToCartLoadingState(this.productId);

  @override
  List<Object?> get props => [productId];
}

final class AddToCartSuccessState extends AddOrRemoveToCartState {
  final CartItems cartItems;
  const AddToCartSuccessState(this.cartItems);
}

final class AddToCartErrorState extends AddOrRemoveToCartState {
  final String message;
  const AddToCartErrorState(this.message);
}

//**********************************

final class RemoveFromCartLoadingState extends AddOrRemoveToCartState {
  final int cartItemId;
  const RemoveFromCartLoadingState(this.cartItemId);

  @override
  List<Object?> get props => [cartItemId];
}

final class RemoveFromCartSuccessState extends AddOrRemoveToCartState {
  final CartItems cartItems;
  const RemoveFromCartSuccessState(this.cartItems);
}

final class RemoveFromCartErrorState extends AddOrRemoveToCartState {
  final String message;
  const RemoveFromCartErrorState(this.message);
}