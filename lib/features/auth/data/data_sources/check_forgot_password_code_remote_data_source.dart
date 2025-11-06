import 'package:dartz/dartz.dart';
import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../../../../core/errors/failures.dart';

abstract class CheckForgotPasswordCodeRemoteDataSource {
  Future<Either<Failure, String>> checkForgotPasswordCode({
    required String verifyCode,
  });
}

class CheckForgotPasswordCodeRemoteDataSourceImpl
    implements CheckForgotPasswordCodeRemoteDataSource {
  final ApiService apiService;

  CheckForgotPasswordCodeRemoteDataSourceImpl(this.apiService);

  @override
  Future<Either<Failure, String>> checkForgotPasswordCode({
    required String verifyCode,
  }) async {
    try {
      final response = await ApiService.post(
        endpoint: EndPoints.checkForgetPasswordCode,
        body: {'verify_code': verifyCode},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data['message'] ?? 'Code verified successfully');
      } else {
        return Left(
          ServerFailure(
            response.data['message'] ?? 'Invalid verification code',
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
