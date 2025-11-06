import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../model/fav_model.dart';

abstract class GetFavouriteRemoteDataSource {
  final ApiService apiService;

  const GetFavouriteRemoteDataSource(this.apiService);
  Future<FavouriteModel> getFavourite();
}

class FavouriteRemoteDataSourceImpl extends GetFavouriteRemoteDataSource {
  FavouriteRemoteDataSourceImpl(super.apiService);

  @override
  Future<FavouriteModel> getFavourite() {
    return ApiService.getData(
      endpoint: EndPoints.wishlist,
      withToken: true,
    ).then((response) {
      if (response.statusCode == 200) {
        return FavouriteModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load favourite data');
      }
    });
  }
}
