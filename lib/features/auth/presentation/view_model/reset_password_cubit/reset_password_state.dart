import 'package:equatable/equatable.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object?> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {
  const ResetPasswordInitial();
}

class ResetPasswordLoading extends ResetPasswordState {
  const ResetPasswordLoading();
}

class ResetPasswordLinkSent extends ResetPasswordState {
  const ResetPasswordLinkSent();
}

class ResetPasswordCodeVerified extends ResetPasswordState {
  const ResetPasswordCodeVerified();
}

class ResetPasswordResetSuccess extends ResetPasswordState {
  const ResetPasswordResetSuccess();
}

class ResetPasswordError extends ResetPasswordState {
  final String message;

  const ResetPasswordError(this.message);

  @override
  List<Object?> get props => [message];
}

class ResetPasswordVisibilityChanged extends ResetPasswordState {
  final bool isVisible;

  const ResetPasswordVisibilityChanged(this.isVisible);

  @override
  List<Object?> get props => [isVisible];
}
