import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../model/cart_model.dart';

abstract class UpdateCartRemoteDataSource {
  final ApiService apiService;

  const UpdateCartRemoteDataSource(this.apiService);

  Future<CartItems> updateQuantity({
    required int cartItemId,
    required int quantity,
  });
}

class UpdateCartRemoteDataSourceImpl extends UpdateCartRemoteDataSource {
  const UpdateCartRemoteDataSourceImpl(super.apiService);

  @override
  Future<CartItems> updateQuantity({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      final response = await ApiService.post(
        endpoint: EndPoints.updateCart,
        withToken: true,
        body: {'cart_item_id': cartItemId, 'quantity': quantity},
      );

      // ✅ التحقق من الـ status code
      if (response.statusCode == 201 || response.statusCode == 200) {
        // ✅ الـ data موجود مباشرة في response.data['data']
        if (response.data['data'] != null) {
          return CartItems.fromJson(response.data['data']);
        } else {
          throw Exception('No data returned from server');
        }
      } else {
        throw Exception('Failed to update cart: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error updating cart: $e');
    }
  }
}