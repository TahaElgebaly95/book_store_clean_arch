import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/data/local/shared_helper.dart';
import '../../../../../core/data/local/shared_keys.dart';
import '../../../domain/entity/auth_entity.dart';
import '../../../domain/use_cases/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit(this._registerUseCase) : super(const RegisterInitial());

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    emit(RegisterPasswordVisibilityChanged(
      _isPasswordVisible,
      _isConfirmPasswordVisible,
    ));
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    emit(RegisterPasswordVisibilityChanged(
      _isPasswordVisible,
      _isConfirmPasswordVisible,
    ));
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(const RegisterLoading());

    final result = await _registerUseCase(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: confirmPassword,
    );

    result.fold(
          (failure) => emit(RegisterError(failure.errMessage)),
          (auth) async {
        await SharedHelper.set(key: SharedKey.token, value: auth.token);
        await SharedHelper.set(key: SharedKey.userID, value: auth.user.id.toString());
        await SharedHelper.set(key: SharedKey.name, value: auth.user.name);
        await SharedHelper.set(key: SharedKey.email, value: auth.user.email);
        emit(RegisterSuccess(auth));
      },
    );
  }
}