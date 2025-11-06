import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../model/cart_model.dart';

abstract class AddToCartRemoteDataSource {
  final ApiService apiService;

  AddToCartRemoteDataSource(this.apiService);

  Future<CartItems> addToCart({required int productId});
}

class AddToCartRemoteDataSourceImpl extends AddToCartRemoteDataSource {
  AddToCartRemoteDataSourceImpl(super.apiService);

  @override
  Future<CartItems> addToCart({required int productId}) async {
    try {
      final response = await ApiService.post(
        endpoint: EndPoints.addToCart,
        withToken: true,
        body: {'product_id': productId},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['data'] != null) {
          return CartItems.fromJson(response.data['data']);
        } else {
          throw Exception('No data returned from server');
        }
      } else {
        throw Exception('Failed to add to cart: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error adding to cart: $e');
    }
  }
}
