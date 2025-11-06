part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterSuccess extends RegisterState {
  final AuthEntity auth;
  const RegisterSuccess(this.auth);
  @override
  List<Object?> get props => [auth];
}

class RegisterError extends RegisterState {
  final String message;
  const RegisterError(this.message);
  @override
  List<Object?> get props => [message];
}

class RegisterPasswordVisibilityChanged extends RegisterState {
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;

  const RegisterPasswordVisibilityChanged(
      this.isPasswordVisible,
      this.isConfirmPasswordVisible,
      );

  @override
  List<Object?> get props => [isPasswordVisible, isConfirmPasswordVisible];
}