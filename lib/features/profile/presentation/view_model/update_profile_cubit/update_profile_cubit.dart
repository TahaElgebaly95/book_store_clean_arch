import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/update_profile_use_case.dart';
import 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileUseCase useCase;

  UpdateProfileCubit(this.useCase) : super(UpdateProfileInitial());

  void updateProfile({
    required String name,
    required String email,
    required String phone,
    required String city,
    required String address,
  }) async {
    emit(UpdateProfileLoading());
    final result = await useCase.call(
      name: name,
      email: email,
      phone: phone,
      city: city,
      address: address,
    );
    result.fold(
          (failure) => emit(UpdateProfileError(failure.errMessage)),
          (user) => emit(UpdateProfileSuccess(user)),
    );
  }
}