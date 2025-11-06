import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/ckechout_model.dart';
import '../../../data/repo/order_repo.dart';
import '../../../domain/use_cases/checkout_use_case.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.orderRepo) : super(CheckoutInitialState());

  final OrderRepo orderRepo;

  static CheckoutCubit get(context) => BlocProvider.of(context);

  Future<void> getCheckout() async {
    emit(CheckoutLoadingState());
    final result = await CheckoutUseCase(orderRepo).call();
    result.fold(
          (failure) => emit(CheckoutErrorState(failure.errMessage)),
          (checkoutModel) => emit(CheckoutSuccessState(checkoutModel)),
    );
  }
}