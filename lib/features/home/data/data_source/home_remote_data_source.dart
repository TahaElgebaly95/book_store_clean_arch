// ========== 4. home_remote_data_source.dart (UPDATED) ==========
import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';
import '../model/categories/category_model.dart';
import '../model/products/home_product_model.dart';
import '../model/slider_model/slider_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();

  Future<List<HomeProductModel>> getCategoryProducts(int categoryId);

  Future<List<HomeProductModel>> getBestSellers();

  Future<List<HomeProductModel>> getNewArrivals();

  Future<List<SliderModel>> getSliders();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await ApiService.getData(endpoint: EndPoints.categories);
    final data = response.data['data']['categories'] as List;
    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }

  @override
  Future<List<HomeProductModel>> getCategoryProducts(int categoryId) async {
    final response = await ApiService.getData(
      endpoint: '${EndPoints.showCategories}$categoryId',
    );
    final data = response.data['data']['products'] as List;
    return data.map((e) => HomeProductModel.fromJson(e)).toList();
  }

  @override
  Future<List<HomeProductModel>> getBestSellers() async {
    final response = await ApiService.getData(endpoint: EndPoints.bestseller);
    final data = response.data['data']['products'] as List;
    return data.map((e) => HomeProductModel.fromJson(e)).toList();
  }

  @override
  Future<List<HomeProductModel>> getNewArrivals() async {
    final response = await ApiService.getData(endpoint: EndPoints.newArrival);
    final data = response.data['data']['products'] as List;
    return data.map((e) => HomeProductModel.fromJson(e)).toList();
  }

  @override
  Future<List<SliderModel>> getSliders() async {
    final response = await ApiService.getData(endpoint: EndPoints.sliders);
    final data = response.data['data']['sliders'] as List;
    return data.map((e) => SliderModel.fromJson(e)).toList();
  }
}
