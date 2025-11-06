import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../model/user_model.dart';

abstract class UpdateProfileRemoteDataSource {
  Future<UserModel> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String city,
    required String address,
  });
}

class UpdateProfileRemoteDataSourceImpl implements UpdateProfileRemoteDataSource {
  final ApiService apiService;

  UpdateProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserModel> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String city,
    required String address,
  }) async {
    final response = await ApiService.post(
      endpoint: EndPoints.updateProfile,
      withToken: true,
      body: {
        'name': name,
        'email': email,
        'phone': phone,
        'city': city,
        'address': address,
      },
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data['data']);
    }
    throw Exception('Failed to update profile');
  }
}