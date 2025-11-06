import 'package:book_store_mvvm/features/favourite/data/model/fav_model.dart';

import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';

abstract class AddFavouriteRemoteDataSource {
  final ApiService apiService;

  AddFavouriteRemoteDataSource(this.apiService);

  Future<FavouriteModel> addToFavourite(int id);
}

class AddFavouriteRemoteDataSourceImpl extends AddFavouriteRemoteDataSource {
  AddFavouriteRemoteDataSourceImpl(super.apiService);

  @override
  Future<FavouriteModel> addToFavourite(int id) {
    return ApiService.post(
      endpoint: EndPoints.addToWishlist,
      withToken: true,
      body: {'product_id': id},
    ).then((value) {
      if (value.statusCode == 200) {
        return FavouriteModel.fromJson(value.data);
      } else {
        throw Exception('Failed to add to favourite');
      }
    });
  }
}
