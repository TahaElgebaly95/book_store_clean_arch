import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/show_single_order_use_case.dart';
import 'show_single_order_state.dart';

class ShowSingleOrderCubit extends Cubit<ShowSingleOrderState> {
  final ShowSingleOrderUseCase _showSingleOrderUseCase;

  ShowSingleOrderCubit(this._showSingleOrderUseCase) : super(ShowSingleOrderInitial());

  void getOrderById(int orderId) async {
    emit(ShowSingleOrderLoading());

    final result = await _showSingleOrderUseCase(orderId);
    result.fold(
          (failure) => emit(ShowSingleOrderError(failure.errMessage)),
          (order) => emit(ShowSingleOrderSuccess(order)),
    );
  }
}