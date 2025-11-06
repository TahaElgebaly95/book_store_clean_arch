import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/model/faq_model.dart';
import '../../data/repo/faq_repo.dart';

class GetFaqsByCategoryUseCase {
  final FaqRepo repo;

  GetFaqsByCategoryUseCase(this.repo);

  Future<Either<Failure, FaqModel>> call(String category) async {
    if (category.isEmpty) {
      return Left(ValidationFailure('Category cannot be empty'));
    }
    return await repo.getFaqsByCategory(category);
  }
}

class ValidationFailure extends Failure {
  ValidationFailure(String message) : super(message);
}