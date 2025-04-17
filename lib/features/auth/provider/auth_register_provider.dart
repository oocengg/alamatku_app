import 'package:alamatku_app/core/state/app_state.dart';
import 'package:alamatku_app/features/auth/model/serivces/auth_service.dart';
import 'package:flutter/material.dart';

class AuthRegisterProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  // Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController verificationCodeController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // State
  AppState miniRegisState = AppState.initial;
  AppState miniVerificationState = AppState.initial;
  AppState nextRegisState = AppState.initial;

  // Register Mini
  Future<void> registerCustomer(String email) async {
    miniRegisState = AppState.loading;
    notifyListeners();

    try {
      await _authService.registerCustomer(email);

      miniRegisState = AppState.loaded;
    } catch (e) {
      miniRegisState = AppState.failed;
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  // Verification Code
  Future<Map<String, dynamic>> verificationCode(
    String email,
    String code,
  ) async {
    miniVerificationState = AppState.loading;
    notifyListeners();

    try {
      var data = await _authService.codeVerificationCustomer(email, code);

      miniVerificationState = AppState.loaded;

      // Mengembalikan data response untuk diproses lebih lanjut
      return data;
    } catch (e) {
      miniVerificationState = AppState.failed;
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> completeRegis(
    String email,
    String firstName,
    String lastName,
    String password,
  ) async {
    nextRegisState = AppState.loading;
    notifyListeners();

    try {
      var data = await _authService.completeRegisCustomer(
        email,
        firstName,
        lastName,
        password,
      );

      nextRegisState = AppState.loaded;

      // Mengembalikan data response untuk diproses lebih lanjut
      return data;
    } catch (e) {
      nextRegisState = AppState.failed;
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    verificationCodeController.dispose();
    super.dispose();
  }
}
