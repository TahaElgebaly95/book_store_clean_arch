import 'package:book_store_mvvm/core/data/network/helper/api_service.dart';
import 'package:book_store_mvvm/core/data/network/helper/endpoints.dart';
import '../model/contact_us_model.dart';

abstract class ContactUsRemoteDataSource {
  Future<ContactUsModel> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}

class ContactUsRemoteDataSourceImpl implements ContactUsRemoteDataSource {
  final ApiService apiService;

  ContactUsRemoteDataSourceImpl(this.apiService);

  @override
  Future<ContactUsModel> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      final response = await ApiService.post(
        endpoint: EndPoints.contactUs,
        withToken: true,
        body: {
          'name': name,
          'email': email,
          'subject': subject,
          'message': message,
        },
      );

      if (response.statusCode == 200) {
        return ContactUsModel.fromJson(response.data);
      } else {
        throw Exception('Failed to send message');
      }
    } catch (e) {
      throw Exception('Error sending message: $e');
    }
  }
}