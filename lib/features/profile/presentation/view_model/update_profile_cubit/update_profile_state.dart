import 'package:equatable/equatable.dart';

import '../../../data/model/user_model.dart';

abstract class UpdateProfileState extends Equatable {
  const UpdateProfileState();
  @override
  List<Object?> get props => [];
}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final UserModel user;
  const UpdateProfileSuccess(this.user);
  @override
  List<Object?> get props => [user];
}

class UpdateProfileError extends UpdateProfileState {
  final String message;
  const UpdateProfileError(this.message);
  @override
  List<Object?> get props => [message];
}