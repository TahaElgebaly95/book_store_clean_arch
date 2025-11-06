import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../model/faq_model.dart';

abstract class FaqRepo {
  Future<Either<Failure, FaqModel>> getAllFaqs();
  Future<Either<Failure, FaqModel>> getFaqsByCategory(String category);
}