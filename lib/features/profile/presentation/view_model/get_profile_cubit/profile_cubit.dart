import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/get_user_profile.dart';
import 'profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  final GetProfileUseCase useCase;

  GetProfileCubit(this.useCase) : super(GetProfileInitial());

  void getProfile() async {
    emit(GetProfileLoading());
    final result = await useCase.call();
    result.fold(
          (failure) => emit(GetProfileError(failure.errMessage)),
          (user) => emit(GetProfileSuccess(user)),
    );
  }
}