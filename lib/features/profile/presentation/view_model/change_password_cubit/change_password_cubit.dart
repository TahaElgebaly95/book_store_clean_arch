import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/change_password_use_case.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase useCase;

  ChangePasswordCubit(this.useCase) : super(ChangePasswordInitial());

  void changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    emit(ChangePasswordLoading());
    final result = await useCase.call(
      currentPassword: currentPassword,
      newPassword: newPassword,
      newPasswordConfirmation: newPasswordConfirmation,
    );
    result.fold(
          (failure) => emit(ChangePasswordError(failure.errMessage)),
          (_) => emit(ChangePasswordSuccess()),
    );
  }
}