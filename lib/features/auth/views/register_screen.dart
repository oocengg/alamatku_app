import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/core/widgets/alamatku_button.dart';
import 'package:alamatku_app/core/widgets/alamatku_text_field.dart';
import 'package:alamatku_app/features/auth/views/verifikasi_screen.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                      'Daftar',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF202020),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Silahkan isi data yang benar untuk membuat akun Alamatku',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF1E1E1E),
                      ),
                    ),
                    const SizedBox(height: 44),

                    // Text Field Section
                    const AlamatkuTextField(placeholder: 'E-mail aktif'),
                    const SizedBox(height: 32),

                    // Button Section
                    AlamatkuButton(
                      text: 'Daftar Sekarang',
                      backgroundColor: AppColors.primary500,
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder:
                                (BuildContext context) =>
                                    const VerifikasiScreen(),
                          ),
                        );
                        // Masih butuh get profil (untuk API)
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
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                            children: [
                              const TextSpan(text: "Saya setuju dengan "),
                              TextSpan(
                                text: "Syarat & Ketentuan",
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        print("Syarat & Ketentuan diklik");
                                      },
                              ),
                              const TextSpan(text: " serta "),
                              TextSpan(
                                text: "Kebijakan Privasi ",
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        print("Kebijakan Privasi diklik");
                                      },
                              ),
                              const TextSpan(
                                text: "Alamatku App",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
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
