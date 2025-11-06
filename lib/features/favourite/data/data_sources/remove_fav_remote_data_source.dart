import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../model/fav_model.dart';

abstract class RemoveFavRemoteDataSource {
  final ApiService apiService;

  RemoveFavRemoteDataSource(this.apiService);

  Future<FavouriteModel> removeFavProduct(int id);
}

class RemoveFavRemoteDataSourceImpl extends RemoveFavRemoteDataSource {
  RemoveFavRemoteDataSourceImpl(super.apiService);

  @override
  Future<FavouriteModel> removeFavProduct(int id) async {
    return ApiService.post(
      endpoint: EndPoints.deleteWishlist,
      withToken: true,
      body: {'product_id': id},
    ).then((value) {
      if (value.statusCode == 200) {
        return FavouriteModel.fromJson(value.data);
      } else {
        throw Exception('Failed to remove from favourite');
      }
    });
  }
}
