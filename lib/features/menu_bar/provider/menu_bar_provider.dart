// import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:alamatku_app/core/state/app_state.dart';
import 'package:alamatku_app/features/address/views/address_screen.dart';
import 'package:alamatku_app/features/home/views/home_screen.dart';
import 'package:alamatku_app/features/profile/views/profile_screen.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuBarProvider with ChangeNotifier {
  // Menu Bar  ini gunanya untuk menampung bottom navbar
  // Jadi ga ada screen yang berarti
  // Dashboard ini akan menampung pages yang di klik dari botton navbar

  // Ini index stiap halaman
  int selectedIndex = 0;

  // State untuk loading
  AppState state = AppState.initial;

  // Set Pages yang dipilih
  void setSelectedIndex(BuildContext context, int index) async {
    selectedIndex = index;

    notifyListeners();
  }

  final List icon = [
    BootstrapIcons.house,
    BootstrapIcons.pin_map,
    BootstrapIcons.person,
  ];

  final List iconActive = [
    BootstrapIcons.house_fill,
    BootstrapIcons.pin_map_fill,
    BootstrapIcons.person_fill,
  ];

  // Title buat Icon Diatas
  final List<String> title = ['Beranda', 'Alamatku', 'Akun'];

  // Pages untuk icon icon diatas
  final List<Widget> pages = [
    const HomeScreen(),
    const AddressScreen(),
    const ProfileScreen(),
  ];
}
