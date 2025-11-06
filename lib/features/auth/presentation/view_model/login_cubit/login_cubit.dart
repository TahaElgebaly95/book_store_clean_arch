import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/data/local/shared_helper.dart';
import '../../../../../core/data/local/shared_keys.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(const LoginInitial());

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    emit(LoginPasswordVisibilityChanged(_isPasswordVisible));
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const LoginLoading());

    final result = await _loginUseCase(email: email, password: password);

    result.fold(
          (failure) => emit(LoginError(failure.errMessage)),
          (auth) async {
        await SharedHelper.set(key: SharedKey.token, value: auth.token);
        await SharedHelper.set(key: SharedKey.userID, value: auth.user.id.toString());
        await SharedHelper.set(key: SharedKey.name, value: auth.user.name);
        await SharedHelper.set(key: SharedKey.email, value: auth.user.email);
        emit(LoginSuccess(auth));
      },
    );
  }
}