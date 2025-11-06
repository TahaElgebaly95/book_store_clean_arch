
import 'package:equatable/equatable.dart';

import '../../../domain/entity/auth_entity.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final AuthEntity auth;
  const LoginSuccess(this.auth);
  @override
  List<Object?> get props => [auth];
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);
  @override
  List<Object?> get props => [message];
}

class LoginPasswordVisibilityChanged extends LoginState {
  final bool isVisible;
  const LoginPasswordVisibilityChanged(this.isVisible);
  @override
  List<Object?> get props => [isVisible];
}