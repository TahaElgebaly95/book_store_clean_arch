part of 'fetch_cart_cubit.dart';

sealed class FetchCartState extends Equatable {
  const FetchCartState();

  @override
  List<Object?> get props => [];
}

final class FetchCartInitialState extends FetchCartState {}

final class FetchCartLoadingState extends FetchCartState {}

final class FetchCartSuccessState extends FetchCartState {
  final CartData cartModel;

  const FetchCartSuccessState(this.cartModel);
}

final class FetchCartErrorState extends FetchCartState {
  final String message;

  const FetchCartErrorState(this.message);
}
