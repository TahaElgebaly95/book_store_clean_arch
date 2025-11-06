import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../data_source/faq_remote_data_source.dart';
import '../model/faq_model.dart';
import 'faq_repo.dart';

class FaqRepoImpl implements FaqRepo {
  final FaqRemoteDataSource faqRemoteDataSource;

  FaqRepoImpl({required this.faqRemoteDataSource});

  @override
  Future<Either<Failure, FaqModel>> getAllFaqs() async {
    try {
      final result = await faqRemoteDataSource.getAllFaqs();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FaqModel>> getFaqsByCategory(String category) async {
    try {
      final result = await faqRemoteDataSource.getFaqsByCategory(category);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
