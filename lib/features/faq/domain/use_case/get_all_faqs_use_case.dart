import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/faq_model.dart';
import '../../data/repo/faq_repo.dart';

class GetAllFaqsUseCase extends UseCase<FaqModel, void> {
  final FaqRepo repo;

  GetAllFaqsUseCase(this.repo);

  @override
  Future<Either<Failure, FaqModel>> call([void params]) async {
    return await repo.getAllFaqs();
  }
}