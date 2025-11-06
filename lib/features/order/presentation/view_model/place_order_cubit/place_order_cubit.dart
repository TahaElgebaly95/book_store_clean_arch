import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/place_order_use_case.dart';

part 'place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit(this.placeOrderUseCase) : super(PlaceOrderInitialState());

  final PlaceOrderUseCase placeOrderUseCase;

  static PlaceOrderCubit get(context) => BlocProvider.of(context);

  Future<void> placeOrder({
    required String address,
    required String phone,
    required String name,
    required String email,
    required String governorateId,
    String? paymentMethod,
  }) async {
    emit(PlaceOrderLoadingState());
    final result = await placeOrderUseCase.call(
      address: address,
      phone: phone,
      name: name,
      email: email,
      governorateId: governorateId,
      paymentMethod: paymentMethod,
    );
    result.fold(
          (failure) => emit(PlaceOrderErrorState(failure.errMessage)),
          (order) => emit(PlaceOrderSuccessState(order)),
    );
  }
}