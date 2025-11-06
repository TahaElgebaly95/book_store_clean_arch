import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../../../../core/errors/failures.dart';
import '../model/auth_model.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failure, AuthModel>> login({
    required String email,
    required String password,
  });
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService _apiService;

  LoginRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, AuthModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiService.post(
        endpoint: EndPoints.login,withToken: true,
        body: {'email': email, 'password': password},
      );
      return Right(AuthModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}