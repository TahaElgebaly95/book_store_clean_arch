import 'package:book_store_mvvm/core/data/network/helper/api_service.dart';
import 'package:book_store_mvvm/core/data/network/helper/endpoints.dart';
import '../model/faq_model.dart';

abstract class FaqRemoteDataSource {
  Future<FaqModel> getAllFaqs();
  Future<FaqModel> getFaqsByCategory(String category);
}

class FaqRemoteDataSourceImpl implements FaqRemoteDataSource {
  final ApiService apiService;

  FaqRemoteDataSourceImpl(this.apiService);

  @override
  Future<FaqModel> getAllFaqs() async {
    try {
      final response = await ApiService.getData(endpoint: EndPoints.faqs,withToken: true);

      if (response.statusCode == 200) {
        return FaqModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load FAQs');
      }
    } catch (e) {
      throw Exception('Error loading FAQs: $e');
    }
  }

  @override
  Future<FaqModel> getFaqsByCategory(String category) async {
    try {
      final response = await ApiService.getData(endpoint: EndPoints.faqs,withToken: true,
        queryParameters: {'category': category},
      );

      if (response.statusCode == 200) {
        return FaqModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load FAQs for category');
      }
    } catch (e) {
      throw Exception('Error loading FAQs by category: $e');
    }
  }
}