import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/core/widgets/alamatku_button.dart';
import 'package:alamatku_app/core/widgets/alamatku_text_field.dart';
import 'package:alamatku_app/features/auth/views/login_screen.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VerifikasiSuksesScreen extends StatefulWidget {
  const VerifikasiSuksesScreen({super.key});

  @override
  State<VerifikasiSuksesScreen> createState() => _VerifikasiSuksesScreenState();
}

class _VerifikasiSuksesScreenState extends State<VerifikasiSuksesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          _buildBackground(),
          Column(
            children: [
              const SizedBox(height: 70),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 28,
                  horizontal: 16,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            BootstrapIcons.arrow_left_circle_fill,
                            size: 24,
                            color: AppColors.primary700,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Image.asset(
                          height: 64,
                          'assets/images/alamatku_logo.png',
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    const Text(
                      'Verifikasi Kontak',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF202020),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Email Anda berhasil terverifikasi. Sekarang Anda bisa login dengan email.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF1E1E1E),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Lengkapi data berikut sebelum melakan login.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF1E1E1E),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Text Field Section
                    const AlamatkuTextField(placeholder: 'User ID'),
                    const SizedBox(height: 12),
                    const AlamatkuTextField(placeholder: 'First Name'),
                    const SizedBox(height: 12),
                    const AlamatkuTextField(placeholder: 'Last Name'),
                    const SizedBox(height: 12),
                    const AlamatkuTextField(
                      placeholder: 'Password',
                      isPassword: true,
                    ),
                    const SizedBox(height: 32),

                    // Button Section
                    AlamatkuButton(
                      text: 'Selanjutnya',
                      backgroundColor: AppColors.primary500,
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(
                            builder:
                                (BuildContext context) => const LoginScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // Footer Section
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Tidak menerima kode verifikasi?\n",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.black,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text: "Kirim Ulang",
                                style: const TextStyle(
                                  color: Colors.blue,
                                  height: 1.5,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        print("Syarat & Ketentuan diklik");
                                      },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildBackground() {
    return Container(height: 181, color: AppColors.primary500);
  }
}
