import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../../../../core/errors/failures.dart';
import '../model/auth_model.dart';

abstract class RegisterRemoteDataSource {
  Future<Either<Failure, AuthModel>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final ApiService _apiService;

  RegisterRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, AuthModel>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await ApiService.post(
        endpoint: EndPoints.register,withToken: true,
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      return Right(AuthModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}