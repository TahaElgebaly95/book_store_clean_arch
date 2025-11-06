import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../model/cart_model.dart';

abstract class FetchCartRemoteDataSource {
  final ApiService apiService;

  FetchCartRemoteDataSource(this.apiService);

  Future<CartData> fetchCart();
}

class FetchCartRemoteDataSourceImpl extends FetchCartRemoteDataSource {
  FetchCartRemoteDataSourceImpl(super.apiService);

  @override
  Future<CartData> fetchCart() {
    return ApiService.getData(endpoint: EndPoints.cart, withToken: true).then((
      response,
    ) {
      if (response.statusCode == 200) {
        return CartData.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load cart data');
      }
    });
  }
}
