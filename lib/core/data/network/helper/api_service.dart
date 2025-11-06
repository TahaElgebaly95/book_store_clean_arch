import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../local/shared_helper.dart';
import '../../local/shared_keys.dart';
import 'endpoints.dart';

//
// part 'api_service.g.dart';
// @GenerateApiService()
// @RestApi(baseUrl: EndPoints.baseUle)
// abstract class ApiService {
//   @GET()
//   Future<Response> getData({
//     required String endpoint,
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? headers,
//     bool? withToken = false,
//   });
// }



class ApiService {
  static Dio? dio;

  ApiService(Dio dio);

  static init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUle,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    dio?.interceptors.add(PrettyDioLogger());
    // customization
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  static Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool? withToken = false,
  }) async {
    dio?.options.headers = headers;
    if (withToken!) {
      dio?.options.headers = {
        'Authorization':
        'Bearer ${await SharedHelper.get(key: SharedKey.token)}',
      };
    }
    return await dio!.get(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  static Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool? withToken = false,
  }) async {
    dio?.options.headers = headers;
    if (withToken!) {
      dio?.options.headers = {
        'Authorization':
        'Bearer ${await SharedHelper.get(key: SharedKey.token)}',
      };
    }
    return await dio!.post(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  static Future<Response> put({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool? withToken = false,
  }) async {
    dio?.options.headers = headers;
    if (withToken!) {
      dio?.options.headers = {
        'Authorization':
        'Bearer ${await SharedHelper.get(key: SharedKey.token)}',
      };
    }
    return await dio!.put(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  static Future<Response> patch({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool? withToken = false,
  }) async {
    dio?.options.headers = headers;
    if (withToken!) {
      dio?.options.headers = {
        'Authorization':
        'Bearer ${await SharedHelper.get(key: SharedKey.token)}',
      };
    }
    return await dio!.patch(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  static Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool? withToken = false,
  }) async {
    dio?.options.headers = headers;
    if (withToken!) {
      dio?.options.headers = {
        'Authorization':
        'Bearer ${await SharedHelper.get(key: SharedKey.token)}',
      };
    }
    return await dio!.delete(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }
}