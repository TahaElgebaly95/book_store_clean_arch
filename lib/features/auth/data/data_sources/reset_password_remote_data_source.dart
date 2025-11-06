import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../../../../core/errors/failures.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<Either<Failure, void>> resetPassword({
    required String code,
    required String password,
    required String passwordConfirmation,
  });
}

class ForgotPasswordRemoteDataSourceImpl
    implements ResetPasswordRemoteDataSource {
  final ApiService _apiService;

  ForgotPasswordRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, void>> resetPassword({
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await ApiService.post(
        endpoint: EndPoints.resetPassword,
        withToken: true,
        body: {
          'verify_code': code,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['message'] ?? 'Password reset successfully';
      } else {
        return Left(
          ServerFailure(response.data['message'] ?? 'Failed to reset password'),
        );
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
