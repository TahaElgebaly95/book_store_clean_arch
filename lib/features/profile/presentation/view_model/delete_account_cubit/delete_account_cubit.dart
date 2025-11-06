import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/delete_account_use_case.dart';
import 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountUseCase useCase;

  DeleteAccountCubit(this.useCase) : super(DeleteAccountInitial());

  Future<void> deleteAccount(String currentPassword) async {
    emit(DeleteAccountLoading());
    final result = await useCase.call(currentPassword);
    result.fold(
      (failure) => emit(DeleteAccountError(failure.errMessage)),
      (_) => emit(DeleteAccountSuccess()),
    );
  }
}
