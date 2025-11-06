part of 'checkout_cubit.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

final class CheckoutInitialState extends CheckoutState {}

final class CheckoutLoadingState extends CheckoutState {}

final class CheckoutSuccessState extends CheckoutState {
  final CheckOutModel checkoutModel;

  const CheckoutSuccessState(this.checkoutModel);

  @override
  List<Object?> get props => [checkoutModel];
}

final class CheckoutErrorState extends CheckoutState {
  final String error;

  const CheckoutErrorState(this.error);

  @override
  List<Object?> get props => [error];
}