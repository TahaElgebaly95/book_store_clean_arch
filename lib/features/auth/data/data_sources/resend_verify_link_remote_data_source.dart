import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../../../../core/errors/failures.dart';


abstract class ResendVerifyLinkRemoteDataSource {
  Future<Either<Failure, void>> resendVerifyLink();
}

class ResendVerifyLinkRemoteDataSourceImpl
    implements ResendVerifyLinkRemoteDataSource {
  final ApiService _apiService;

  ResendVerifyLinkRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, void>> resendVerifyLink() async {
    try {
      final response = await ApiService.getData(
        endpoint: EndPoints.resendVerifyLink,
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
