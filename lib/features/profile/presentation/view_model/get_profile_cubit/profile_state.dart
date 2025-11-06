import 'package:equatable/equatable.dart';

import '../../../data/model/user_model.dart';

abstract class GetProfileState extends Equatable {
  const GetProfileState();
  @override
  List<Object?> get props => [];
}

class GetProfileInitial extends GetProfileState {}

class GetProfileLoading extends GetProfileState {}

class GetProfileSuccess extends GetProfileState {
  final UserModel user;
  const GetProfileSuccess(this.user);
  @override
  List<Object?> get props => [user];
}

class GetProfileError extends GetProfileState {
  final String message;
  const GetProfileError(this.message);
  @override
  List<Object?> get props => [message];
}