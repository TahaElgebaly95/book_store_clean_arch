import 'package:equatable/equatable.dart';
import '../../../data/model/faq_model.dart';

abstract class FaqState extends Equatable {
  const FaqState();

  @override
  List<Object?> get props => [];
}

class FaqInitial extends FaqState {}

class FaqLoading extends FaqState {}

class FaqSuccess extends FaqState {
  final List<FaqItemModel> faqs;

  const FaqSuccess(this.faqs);

  @override
  List<Object?> get props => [faqs];
}

class FaqEmpty extends FaqState {}

class FaqError extends FaqState {
  final String message;

  const FaqError(this.message);

  @override
  List<Object?> get props => [message];
}