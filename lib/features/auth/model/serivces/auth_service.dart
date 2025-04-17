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
    } on DioException catch (e) {
      throw Exception(e.toString());
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
    } on DioException catch (e) {
      throw Exception(e.toString());
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
    } on DioException catch (e) {
      throw Exception(e.toString());
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
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
