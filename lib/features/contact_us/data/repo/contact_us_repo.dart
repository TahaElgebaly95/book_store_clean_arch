import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../model/contact_us_model.dart';

abstract class ContactUsRepo {
  Future<Either<Failure, ContactUsModel>> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}