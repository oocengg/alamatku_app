import 'package:alamatku_app/core/state/app_state.dart';
import 'package:alamatku_app/features/auth/model/serivces/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLoginProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  // Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // State
  AppState loginState = AppState.initial;

  // Register Mini
  Future<void> loginCustomer(String email, String password) async {
    loginState = AppState.loading;
    notifyListeners();

    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      final response = await _authService.login(email, password);

      preferences.setString("email", response.customer!.email);
      preferences.setString(
        "cust_id",
        response.customer!.customerId.toString(),
      );
      preferences.setBool("isLoggedIn", true);
      preferences.setString("token", response.token);
      preferences.setString("first_name", response.customer!.firstName);
      preferences.setString("last_name", response.customer!.lastName);

      loginState = AppState.loaded;
    } catch (e) {
      loginState = AppState.failed;
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
