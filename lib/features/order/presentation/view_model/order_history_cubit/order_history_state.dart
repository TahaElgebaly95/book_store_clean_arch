import 'package:equatable/equatable.dart';

import '../../../data/model/order_history_model.dart';

sealed class OrderHistoryState extends Equatable {
  const OrderHistoryState();

  @override
  List<Object?> get props => [];
}

final class OrderHistoryInitialState extends OrderHistoryState {}

final class OrderHistoryLoadingState extends OrderHistoryState {}

final class OrderHistorySuccessState extends OrderHistoryState {
  final OrderHistoryModel history;

  const OrderHistorySuccessState(this.history);

  @override
  List<Object?> get props => [history];
}

final class OrderHistoryErrorState extends OrderHistoryState {
  final String error;

  const OrderHistoryErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
