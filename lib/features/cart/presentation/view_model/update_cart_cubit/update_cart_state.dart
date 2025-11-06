part of 'update_cart_cubit.dart';

 class UpdateCartState extends Equatable{
   const UpdateCartState();
   @override
   List<Object?> get props => [];
 }

final class UpdateCartInitialState extends UpdateCartState {}

final class UpdateCartLoadingState extends UpdateCartState {}

final class UpdateCartSuccessState extends UpdateCartState {
  final CartItems cartItems;
  const UpdateCartSuccessState(this.cartItems);
}

final class UpdateCartErrorState extends UpdateCartState {
  final String errorMessage;
  const UpdateCartErrorState(this.errorMessage);
}

