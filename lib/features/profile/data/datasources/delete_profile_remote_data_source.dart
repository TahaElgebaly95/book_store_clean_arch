import '../../../../core/data/network/helper/api_service.dart';
import '../../../../core/data/network/helper/endpoints.dart';

abstract class DeleteAccountRemoteDataSource {
  Future<void> deleteAccount(String currentPassword);
}

class DeleteAccountRemoteDataSourceImpl
    implements DeleteAccountRemoteDataSource {
  final ApiService apiService;

  DeleteAccountRemoteDataSourceImpl(this.apiService);

  @override
  Future<void> deleteAccount(String currentPassword) async {
    // افترض أن 'ApiService.post' هو استدعاء static صحيح بناءً على ملفاتك
    final response = await ApiService.post(
      endpoint: EndPoints.deleteAccount,
      withToken: true,
      body: {'current_password': currentPassword},
    );

    // ✅ --- التعديل الأهم هنا ---
    // تحقق فقط إذا لم تكن الاستجابة ناجحة (أكواد 2xx)
    if (response.statusCode! < 200 || response.statusCode! >= 300) {
      // ارمِ رسالة الخطأ الحقيقية القادمة من السيرفر
      // هذا سيصلح مشكلة 422 ويظهر للمستخدم "كلمة المرور غير صالحة"
      // بدلاً من "Failed to delete account"
      throw Exception(response.data['message'] ?? 'Failed to delete account');
    }

    // إذا كان الكود 200 (أو 201, 204)، فالدالة ستنتهي بنجاح (void)
  }
}
