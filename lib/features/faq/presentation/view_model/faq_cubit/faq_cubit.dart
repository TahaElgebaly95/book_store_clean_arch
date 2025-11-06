import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_all_faqs_use_case.dart';
import 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  final GetAllFaqsUseCase getAllFaqsUseCase;

  FaqCubit(this.getAllFaqsUseCase) : super(FaqInitial());

  String _searchQuery = '';

  Future<void> getAllFaqs() async {
    emit(FaqLoading());

    final result = await getAllFaqsUseCase.call();

    result.fold((failure) => emit(FaqError(failure.errMessage)), (faqModel) {
      if (faqModel.data.faqs.isEmpty) {
        emit(FaqEmpty());
      } else {
        emit(FaqSuccess(faqModel.data.faqs));
      }
    });
  }

  void searchFaqs(String query) {
    _searchQuery = query.toLowerCase();

    if (state is FaqSuccess) {
      final currentFaqs = (state as FaqSuccess).faqs;

      if (query.isEmpty) {
        emit(FaqSuccess(currentFaqs));
      } else {
        final filteredFaqs =
            currentFaqs.where((faq) {
              return faq.question.toLowerCase().contains(_searchQuery) ||
                  faq.answer.toLowerCase().contains(_searchQuery);
            }).toList();

        if (filteredFaqs.isEmpty) {
          emit(FaqEmpty());
        } else {
          emit(FaqSuccess(filteredFaqs));
        }
      }
    }
  }

  void clearFilters() {
    _searchQuery = '';
    getAllFaqs();
  }

  String get searchQuery => _searchQuery;
}
