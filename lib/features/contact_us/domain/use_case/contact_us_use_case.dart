import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/model/contact_us_model.dart';
import '../../data/repo/contact_us_repo.dart';

class SendMessageUseCase {
  final ContactUsRepo repo;

  SendMessageUseCase(this.repo);

  Future<Either<Failure, ContactUsModel>> call({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    // Validation
    if (name.isEmpty) {
      return Left(ValidationFailure('Name is required'));
    }
    if (email.isEmpty) {
      return Left(ValidationFailure('Email is required'));
    }
    if (!_isValidEmail(email)) {
      return Left(ValidationFailure('Invalid email format'));
    }
    if (subject.isEmpty) {
      return Left(ValidationFailure('Subject is required'));
    }
    if (message.isEmpty) {
      return Left(ValidationFailure('Message is required'));
    }

    return await repo.sendMessage(
      name: name,
      email: email,
      subject: subject,
      message: message,
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}

class ValidationFailure extends Failure {
  ValidationFailure(super.message);
}