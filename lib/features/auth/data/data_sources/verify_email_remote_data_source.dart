import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../../../../core/errors/failures.dart';

abstract class VerifyEmailRemoteDataSource {
  Future<Either<Failure, void>> verifyEmail({required String verifyCode});
}

class VerifyEmailRemoteDataSourceImpl implements VerifyEmailRemoteDataSource {
  final ApiService _apiService;

  VerifyEmailRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, void>> verifyEmail({
    required String verifyCode,
  }) async {
    try {
      final response = await ApiService.post(
        endpoint: EndPoints.sendForgetPasswordLink,
        body: {'verify_code': verifyCode},
        withToken: true,
      );
      return response.data;
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
