import 'package:alamatku_app/core/state/app_state.dart';
import 'package:alamatku_app/features/profile/model/service/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileService _profileService = ProfileService();

  AppState profileState = AppState.initial;
  AppState logoutState = AppState.initial;

  String? firstName = '';
  String? email = '';
  String? lastName = '';
  String? custId = '';

  Future<void> setData() async {
    profileState = AppState.loading;
    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      firstName = preferences.getString('first_name');
      lastName = preferences.getString('last_name');
      email = preferences.getString('email');
      custId = preferences.getString('cust_id');

      profileState = AppState.loaded;
      notifyListeners();
    } catch (e) {
      profileState = AppState.failed;
      notifyListeners();
    }
  }

  Future<bool> logout() async {
    logoutState = AppState.loading;
    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token") ?? '';

    try {
      await _profileService.logout(token);
      await preferences.clear();

      logoutState = AppState.loaded;
      return true;
    } catch (e) {
      logoutState = AppState.failed;
      return false;
    } finally {
      notifyListeners();
    }
  }
}
