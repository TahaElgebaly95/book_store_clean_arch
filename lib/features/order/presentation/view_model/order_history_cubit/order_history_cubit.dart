import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/get_order_history_use_case.dart';
import 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  final GetOrderHistoryUseCase _getOrderHistoryUseCase;

  OrderHistoryCubit(this._getOrderHistoryUseCase) : super(OrderHistoryInitialState());

  Future<void> getOrderHistory() async {
    emit(OrderHistoryLoadingState());

    final result = await _getOrderHistoryUseCase();
    result.fold(
          (failure) => emit(OrderHistoryErrorState(failure.errMessage)),
          (history) => emit(OrderHistorySuccessState(history)),
    );
  }
}