import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/core/widgets/alamatku_button.dart';
import 'package:alamatku_app/core/widgets/alamatku_text_field.dart';
import 'package:alamatku_app/features/auth/views/verifikasi_sukses_screen.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VerifikasiScreen extends StatefulWidget {
  const VerifikasiScreen({super.key});

  @override
  State<VerifikasiScreen> createState() => _VerifikasiScreenState();
}

class _VerifikasiScreenState extends State<VerifikasiScreen> {
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
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text:
                                "Masukkan kode verifikasi yang telah kami kirim ke ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black,
                            ),
                          ),
                          TextSpan(
                            text: "fauzinugraha@gmail.com",
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 44),

                    // Text Field Section
                    const AlamatkuTextField(placeholder: 'Kode Verifikasi'),
                    const SizedBox(height: 32),

                    // Button Section
                    AlamatkuButton(
                      text: 'Masukkan Kode',
                      backgroundColor: AppColors.primary500,
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder:
                                (BuildContext context) =>
                                    const VerifikasiSuksesScreen(),
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
