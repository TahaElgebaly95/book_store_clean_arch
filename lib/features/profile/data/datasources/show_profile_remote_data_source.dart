import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../model/user_model.dart';

abstract class GetProfileRemoteDataSource {
  Future<UserModel> getUserProfile();
}

class GetProfileRemoteDataSourceImpl implements GetProfileRemoteDataSource {
  final ApiService apiService;

  GetProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserModel> getUserProfile() async {
    final response = await ApiService.getData(
      endpoint: EndPoints.profile,
      withToken: true,
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data['data']);
    }
    throw Exception('Failed to load profile');
  }
}