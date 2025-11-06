import 'package:book_store_mvvm/core/data/local/shared_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../../../../core/errors/failures.dart';

abstract class LogoutRemoteDataSource {
  Future<Either<Failure, dynamic>> logout();
}

class LogoutRemoteDataSourceImpl implements LogoutRemoteDataSource {
  final ApiService _apiService;

  LogoutRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, dynamic>> logout() async {
    try {
      final response = await ApiService.post(
        endpoint: EndPoints.logout,
        withToken: true,
      );
      SharedHelper.clear();
      return Right(response.data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
