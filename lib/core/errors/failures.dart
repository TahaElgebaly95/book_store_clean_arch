import 'package:dio/dio.dart';

/// Base Failure class
abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

/// Server-related failures
class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');

      case DioExceptionType.badResponse:
        return ServerFailure._fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');

      case DioExceptionType.unknown:
        if (dioError.message != null &&
            dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Unexpected error occurred');

      }
  }

  factory ServerFailure._fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      // Try to extract error message from response
      if (response is Map<String, dynamic>) {
        if (response.containsKey('message')) {
          return ServerFailure(response['message']);
        }
        if (response.containsKey('error')) {
          if (response['error'] is String) {
            return ServerFailure(response['error']);
          }
          if (response['error'] is List && response['error'].isNotEmpty) {
            return ServerFailure(response['error'][0].toString());
          }
        }
      }
      return ServerFailure('Authentication error');
    } else if (statusCode == 404) {
      return ServerFailure('Resource not found');
    } else if (statusCode == 422) {
      // Validation error
      if (response is Map<String, dynamic>) {
        if (response.containsKey('message')) {
          return ServerFailure(response['message']);
        }
        if (response.containsKey('errors')) {
          final errors = response['errors'];
          if (errors is Map) {
            final firstError = errors.values.first;
            if (firstError is List && firstError.isNotEmpty) {
              return ServerFailure(firstError[0].toString());
            }
          }
        }
      }
      return ServerFailure('Validation error');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error');
    } else {
      return ServerFailure('Oops! Something went wrong');
    }
  }
}

/// Validation-related failures (for client-side validation)
class ValidationFailure extends Failure {
  ValidationFailure(super.errMessage);
}

/// Cache-related failures
class CacheFailure extends Failure {
  CacheFailure(super.errMessage);
}

/// Network-related failures
class NetworkFailure extends Failure {
  NetworkFailure(super.errMessage);
}