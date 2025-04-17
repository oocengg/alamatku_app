import 'package:alamatku_app/core/services/api_client.dart';
import 'package:dio/dio.dart';

class ProfileService {
  final ApiClient _apiClient = ApiClient();

  // Logout API
  Future<void> logout(String token) async {
    try {
      final response = await _apiClient.dio.post(
        '/api/blueray/customer/logout',
        options: Options(headers: {"Authorization": "Token $token"}),
      );

      print('Response: ${response.data}');
    } catch (e) {
      if (e is DioException) {
        print('DioError: ${e.message}');
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            print('Connection timeout');
            break;
          case DioExceptionType.receiveTimeout:
            print('Receive timeout');
            break;
          case DioExceptionType.sendTimeout:
            print('Send timeout');
            break;
          case DioExceptionType.badResponse:
            print('Response error status code: ${e.response?.statusCode}');
            print('Response error status code: ${e.response?.statusCode}');
            print('Response data: ${e.response?.data}');
            break;
          case DioExceptionType.cancel:
            print('Request cancelled');
            break;
          case DioExceptionType.unknown:
            print('Other error occurred');
            break;
          case DioExceptionType.badCertificate:
            print('Bad Certificate Error');
            throw UnimplementedError();
          case DioExceptionType.connectionError:
            print('Connection Rrror');
            throw UnimplementedError();
        }
      } else {
        print('Unexpected error $e');
      }
      rethrow;
    }
  }
}
