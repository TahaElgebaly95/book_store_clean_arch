import 'package:book_store_mvvm/features/cart/domain/use_cases/update_cart_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/cart_model.dart';

part 'update_cart_state.dart';

class UpdateCartCubit extends Cubit<UpdateCartState> {
  final UpdateCartUseCase updateCartUseCase;

  UpdateCartCubit(this.updateCartUseCase) : super(UpdateCartInitialState());

  static UpdateCartCubit get(context) => BlocProvider.of(context);

  // ✅ تغيير من productId إلى cartItemId
  Future<void> updateCart({
    required int cartItemId,
    required int quantity,
  }) async {
    emit(UpdateCartLoadingState());
    final result = await updateCartUseCase.call(
      cartItemId: cartItemId,
      quantity: quantity,
    );
    result.fold(
          (failure) => emit(UpdateCartErrorState(failure.errMessage)),
          (cartItems) => emit(UpdateCartSuccessState(cartItems)),
    );
  }
}