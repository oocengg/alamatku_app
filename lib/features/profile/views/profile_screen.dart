import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/core/widgets/alamatku_button.dart';
import 'package:alamatku_app/features/auth/views/login_screen.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data profil pengguna
    final String nama = "John Doe";
    final String email = "johndoe@example.com";
    final String phoneNumber = "+1234567890";

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/guest.png'),
              ),
              const SizedBox(height: 20),

              // Nama Pengguna
              Text(
                nama,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Email Pengguna
              Text(
                email,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),

              // Nomor Telepon Pengguna
              Text(
                phoneNumber,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              const Divider(),
              const SizedBox(height: 10),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.dark100),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      BootstrapIcons.pin_map_fill,
                      size: 16,
                      color: AppColors.rose500,
                    ),
                    SizedBox(width: 8),
                    Expanded(child: Text('Total Data Alamatku')),
                    Text('20'),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              AlamatkuButton(
                text: 'Keluar',
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(
                      builder: (BuildContext context) => const LoginScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                backgroundColor: AppColors.rose500,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
