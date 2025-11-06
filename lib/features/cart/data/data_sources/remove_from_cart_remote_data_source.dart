import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../model/cart_model.dart';

abstract class RemoveFromCartRemoteDataSource {
  final ApiService apiService;

  RemoveFromCartRemoteDataSource(this.apiService);

  Future<CartItems> removeFromCart({required int cartItemId});
}

class RemoveFromCartRemoteDataSourceImpl
    extends RemoveFromCartRemoteDataSource {
  RemoveFromCartRemoteDataSourceImpl(super.apiService);

  @override
  Future<CartItems> removeFromCart({required int cartItemId}) {
    return ApiService.post(
      endpoint: EndPoints.removeFromCart,
      withToken: true,
      body: {'cart_item_id': cartItemId},
    ).then((response) {
      if (response.statusCode == 200) {
        return CartItems.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to remove from cart');
      }
    });
  }
}
