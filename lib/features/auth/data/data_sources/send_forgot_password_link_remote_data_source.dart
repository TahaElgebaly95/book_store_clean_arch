import 'package:dartz/dartz.dart';
import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../../../../core/errors/failures.dart';

abstract class SendForgotPasswordLinkRemoteDataSource {
  Future<Either<Failure, String>> sendForgotPasswordLink({
    required String email,
  });
}

class SendForgotPasswordLinkRemoteDataSourceImpl
    implements SendForgotPasswordLinkRemoteDataSource {
  final ApiService apiService;

  SendForgotPasswordLinkRemoteDataSourceImpl(this.apiService);

  @override
  Future<Either<Failure, String>> sendForgotPasswordLink({
    required String email,
  }) async {
    try {
      final response = await ApiService.post(
        endpoint: EndPoints.sendForgetPasswordLink,
        body: {'email': email},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
          response.data['message'] ?? 'Password reset link sent successfully',
        );
      } if (response.statusCode == 422) {
        return Left(
          ServerFailure(
           'Validation Error - Wrong email',
          ),
        );
      }else {
        return Left(
          ServerFailure(
            response.data['message'] ?? 'Failed to send reset link',
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
