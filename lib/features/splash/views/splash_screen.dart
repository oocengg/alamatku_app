import 'dart:async';
import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/features/auth/views/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    startSplashScreen();
    // _buildPage();
  }

  startSplashScreen() async {
    const duration = Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary500,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/splash.png"),
          ),
        ),
      ),
    );
  }

  // _buildPage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.getKeys().isNotEmpty) {
  //     if (prefs.getBool('isLoggedIn')!) {
  //       if (!JwtDecoder.isExpired(prefs.getString('jwt_token')!)) {
  //         setState(() {
  //           isLoggedIn = true;
  //         });
  //       } else {
  //         setState(() {
  //           prefs.setBool("isLoggedIn", false);
  //           prefs.remove("token");
  //           isLoggedIn = false;
  //         });
  //       }
  //     } else {
  //       setState(() {
  //         isLoggedIn = false;
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       isLoggedIn = false;
  //     });
  //   }
  // }
}
