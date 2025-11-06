import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/contact_us_use_case.dart';
import 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final SendMessageUseCase sendMessageUseCase;

  ContactUsCubit(this.sendMessageUseCase) : super(ContactUsInitial());

  Future<void> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    emit(ContactUsLoading());

    final result = await sendMessageUseCase(
      name: name,
      email: email,
      subject: subject,
      message: message,
    );

    result.fold(
      (failure) => emit(ContactUsError(failure.errMessage)),
      (response) => emit(ContactUsSuccess(response.message)),
    );
  }

  void reset() {
    emit(ContactUsInitial());
  }
}
