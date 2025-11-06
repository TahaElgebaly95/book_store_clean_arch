import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../data_source/contact_us_data_source.dart';
import '../model/contact_us_model.dart';
import 'contact_us_repo.dart';

class ContactUsRepoImpl implements ContactUsRepo {
  final ContactUsRemoteDataSource contactUsRemoteDataSource;

  ContactUsRepoImpl({required this.contactUsRemoteDataSource});

  @override
  Future<Either<Failure, ContactUsModel>> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      final result = await contactUsRemoteDataSource.sendMessage(
        name: name,
        email: email,
        subject: subject,
        message: message,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}