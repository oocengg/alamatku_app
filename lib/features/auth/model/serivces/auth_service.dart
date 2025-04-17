import 'package:alamatku_app/core/constant/app_constant.dart';
import 'package:alamatku_app/core/services/api_client.dart';
import 'package:alamatku_app/features/auth/model/models/login_response_model.dart';
import 'package:dio/dio.dart';

class AuthService {
  final ApiClient _apiClient = ApiClient();

  // Login API
  Future<LoginResponseModel> login(String email, String password) async {
    try {
      final response = await _apiClient.dio.post(
        '/api/blueray/customer/login',
        data: {"user_id": email, "password": password},
      );

      final res = LoginResponseModel.fromJson(response.data);

      return res;
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

  // Register API
  Future<void> registerCustomer(String email) async {
    try {
      final response = await _apiClient.dio.post(
        '/api/blueray/customer/register/mini',
        data: {"user_id": email},
        options: Options(headers: {"AccessToken": AppConstant.accessToken}),
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

  Future<Map<String, dynamic>> codeVerificationCustomer(
    String email,
    String code,
  ) async {
    try {
      final response = await _apiClient.dio.post(
        '/api/blueray/customer/register/verify-code',
        data: {"user_id": email, "code": code},
        options: Options(headers: {"AccessToken": AppConstant.accessToken}),
      );

      return response.data as Map<String, dynamic>;
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
            print('Connection Error');
            throw UnimplementedError();
        }
      } else {
        print('Unexpected error $e');
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> completeRegisCustomer(
    String email,
    String firstName,
    String lastName,
    String password,
  ) async {
    try {
      final response = await _apiClient.dio.post(
        '/api/blueray/customer/register/mandatory',
        data: {
          "user_id": email,
          "first_name": firstName,
          "last_name": lastName,
          "password": password,
        },
        options: Options(headers: {"AccessToken": AppConstant.accessToken}),
      );

      return response.data as Map<String, dynamic>;
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
            print('Connection Error');
            throw UnimplementedError();
        }
      } else {
        print('Unexpected error $e');
      }
      rethrow;
    }
  }
}
