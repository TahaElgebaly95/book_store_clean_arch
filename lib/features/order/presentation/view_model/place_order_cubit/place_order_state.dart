part of 'place_order_cubit.dart';

sealed class PlaceOrderState extends Equatable {
  const PlaceOrderState();

  @override
  List<Object?> get props => [];
}

final class PlaceOrderInitialState extends PlaceOrderState {}

final class PlaceOrderLoadingState extends PlaceOrderState {}

final class PlaceOrderSuccessState extends PlaceOrderState {
  final Map<String, dynamic> order;

  const PlaceOrderSuccessState(this.order);

  @override
  List<Object?> get props => [order];
}

final class PlaceOrderErrorState extends PlaceOrderState {
  final String error;

  const PlaceOrderErrorState(this.error);

  @override
  List<Object?> get props => [error];
}