import 'package:equatable/equatable.dart';

import '../../../data/model/show_single_order_model.dart';

abstract class ShowSingleOrderState extends Equatable {
  const ShowSingleOrderState();

  @override
  List<Object?> get props => [];
}

class ShowSingleOrderInitial extends ShowSingleOrderState {}

class ShowSingleOrderLoading extends ShowSingleOrderState {}

class ShowSingleOrderSuccess extends ShowSingleOrderState {
  final ShowSingleOrderModel showSingleOrderModel;

  const ShowSingleOrderSuccess(this.showSingleOrderModel);

  @override
  List<Object?> get props => [showSingleOrderModel];
}

class ShowSingleOrderError extends ShowSingleOrderState {
  final String message;

  const ShowSingleOrderError(this.message);

  @override
  List<Object?> get props => [message];
}
