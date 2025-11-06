import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/check_forgot_password_code_use_case.dart';
import '../../../domain/use_cases/reset_password_use_case.dart';
import '../../../domain/use_cases/send_forgot_password_link_use_case.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final SendForgotPasswordLinkUseCase _sendLinkUseCase;
  final CheckForgotPasswordCodeUseCase _checkCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit({
    required SendForgotPasswordLinkUseCase sendLinkUseCase,
    required CheckForgotPasswordCodeUseCase checkCodeUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
  }) : _sendLinkUseCase = sendLinkUseCase,
       _checkCodeUseCase = checkCodeUseCase,
       _resetPasswordUseCase = resetPasswordUseCase,
       super(const ResetPasswordInitial());

  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  String? _verifiedCode;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    emit(ResetPasswordVisibilityChanged(_isPasswordVisible));
  }

  Future<void> sendLink(String email) async {
    emit(const ResetPasswordLoading());
    final result = await _sendLinkUseCase(email: email);
    result.fold(
      (failure) => emit(
        ResetPasswordError(
          failure.errMessage.isEmpty ? failure.errMessage : 'Validation Error',
        ),
      ),
      (_) => emit(const ResetPasswordLinkSent()),
    );
  }

  Future<void> verifyCode(String verifyCode) async {
    emit(const ResetPasswordLoading());
    final result = await _checkCodeUseCase(verifyCode: verifyCode);
    result.fold((failure) => emit(ResetPasswordError(failure.errMessage)), (_) {
      _verifiedCode = verifyCode;
      emit(const ResetPasswordCodeVerified());
    });
  }

  Future<void> resetPassword({
    required String password,
    required String confirmPassword,
  }) async {
    if (_verifiedCode == null) {
      emit(const ResetPasswordError('Code verification required'));
      return;
    }

    emit(const ResetPasswordLoading());
    final result = await _resetPasswordUseCase(
      code: _verifiedCode!,
      password: password,
      passwordConfirmation: confirmPassword,
    );
    result.fold((failure) => emit(ResetPasswordError(failure.errMessage)), (_) {
      _verifiedCode = null;
      emit(const ResetPasswordResetSuccess());
    });
  }
}
