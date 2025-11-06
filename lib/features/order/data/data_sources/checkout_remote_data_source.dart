import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../model/ckechout_model.dart';

abstract class CheckoutRemoteDataSource {
  final ApiService apiService;

  const CheckoutRemoteDataSource(this.apiService);

  Future<CheckOutModel> getCheckout();
}

class CheckoutRemoteDataSourceImpl extends CheckoutRemoteDataSource {
  const CheckoutRemoteDataSourceImpl(super.apiService);

  @override
  Future<CheckOutModel> getCheckout() async {
    try {
      final response = await ApiService.getData(
        endpoint: EndPoints.checkout,
        withToken: true,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['data'] != null) {
          return CheckOutModel.fromJson(response.data);
        } else {
          throw Exception('No data returned from server');
        }
      } else {
        throw Exception('Failed to get checkout: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting checkout: $e');
    }
  }
}