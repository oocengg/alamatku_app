import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/core/keys/navigator_key.dart';
import 'package:alamatku_app/features/address/provider/address_provider.dart';
import 'package:alamatku_app/features/home/provider/home_provider.dart';
import 'package:alamatku_app/features/menu_bar/provider/menu_bar_provider.dart';
import 'package:alamatku_app/features/splash/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuBarProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => AddressProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alamatku App',
        home: const SplashScreen(),
        theme: ThemeData().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary500),
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.heeboTextTheme(
            Theme.of(context).textTheme,
          ).apply(
            // fontFamily: 'Inter',
            bodyColor: Colors.black,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
            color: Colors.white,
            shadowColor: Colors.black,
            elevation: 20,
            surfaceTintColor: Colors.white,
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.white,
          ),
          dialogTheme: const DialogTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
          ),
          datePickerTheme: const DatePickerThemeData(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
          ),
        ),
        navigatorKey: navigatorKey,
      ),
    );
  }
}

// Test Up Staging
// Test staing 2
