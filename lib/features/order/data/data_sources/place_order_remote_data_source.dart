import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';

abstract class PlaceOrderRemoteDataSource {
  final ApiService apiService;

  const PlaceOrderRemoteDataSource(this.apiService);

  Future<Map<String, dynamic>> placeOrder({
    required String address,
    required String phone,
    required String name,
    required String email,
    required String governorateId,
    String? paymentMethod,
  });
}

class PlaceOrderRemoteDataSourceImpl extends PlaceOrderRemoteDataSource {
  const PlaceOrderRemoteDataSourceImpl(super.apiService);

  @override
  Future<Map<String, dynamic>> placeOrder({
    required String address,
    required String phone,
    required String name,
    required String email,
    required String governorateId,
    String? paymentMethod,
  }) async {
    try {
      final response = await ApiService.post(
        endpoint: EndPoints.placeOrder,
        withToken: true,
        body: {
          'address': address,
          'phone': phone,
          'governorate_id': governorateId,
          'name': name,
          'email': email,
          if (paymentMethod != null) 'payment_method': paymentMethod,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Failed to place order: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error placing order: $e');
    }
  }
}