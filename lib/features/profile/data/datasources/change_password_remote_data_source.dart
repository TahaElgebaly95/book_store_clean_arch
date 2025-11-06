import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';

abstract class ChangePasswordRemoteDataSource {
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation
  });
}

class ChangePasswordRemoteDataSourceImpl implements ChangePasswordRemoteDataSource {
  final ApiService apiService;

  ChangePasswordRemoteDataSourceImpl(this.apiService);

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    final response = await ApiService.post(
      endpoint: EndPoints.changePassword,
      withToken: true,
      body: {
        'current_password': currentPassword,
        'new_password': newPassword,
        'new_password_confirmation': newPasswordConfirmation,
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to change password');
    }
  }
}