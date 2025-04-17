import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/core/state/app_state.dart';
import 'package:alamatku_app/core/widgets/alamatku_button.dart';
import 'package:alamatku_app/core/widgets/alamatku_text_field.dart';
import 'package:alamatku_app/features/auth/provider/auth_register_provider.dart';
import 'package:alamatku_app/features/auth/views/login_screen.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifikasiSuksesScreen extends StatefulWidget {
  final String email;
  const VerifikasiSuksesScreen({super.key, required this.email});

  @override
  State<VerifikasiSuksesScreen> createState() => _VerifikasiSuksesScreenState();
}

class _VerifikasiSuksesScreenState extends State<VerifikasiSuksesScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Consumer<AuthRegisterProvider>(
      builder: (context, authRegisterProvider, _) {
        return SingleChildScrollView(
          child: Stack(
            children: [
              _buildBackground(),
              Form(
                key: _formKey,
                child: Column(
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
                            'Verifikasi Sukses',
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
                          AlamatkuTextField(
                            placeholder: 'First Name',
                            controller:
                                authRegisterProvider.firstNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'First Name tidak boleh kosong';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          AlamatkuTextField(
                            placeholder: 'Last Name',
                            controller: authRegisterProvider.lastNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Last Name tidak boleh kosong';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          AlamatkuTextField(
                            placeholder: 'Password',
                            isPassword: true,
                            controller: authRegisterProvider.passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password tidak boleh kosong';
                              }
                              if (value.length < 8) {
                                return 'Password minimal 8 karakter';
                              }

                              // Cek huruf besar
                              if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                return 'Password harus mengandung huruf besar';
                              }

                              // Cek huruf kecil
                              if (!RegExp(r'[a-z]').hasMatch(value)) {
                                return 'Password harus mengandung huruf kecil';
                              }

                              // Cek angka
                              if (!RegExp(r'[0-9]').hasMatch(value)) {
                                return 'Password harus mengandung angka';
                              }

                              // Ada unsur Unik
                              if (!RegExp(
                                "[!@#\\\$&*~%^()_\\-=+{}\\[\\]\\|:;\"'<>,.?/]",
                              ).hasMatch(value)) {
                                return 'Password harus mengandung simbol';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 32),

                          // Button Section
                          authRegisterProvider.nextRegisState ==
                                  AppState.loading
                              ? Center(child: const CircularProgressIndicator())
                              : AlamatkuButton(
                                text: 'Selanjutnya',
                                backgroundColor: AppColors.primary500,
                                onPressed: () async {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    try {
                                      await authRegisterProvider.completeRegis(
                                        widget.email,
                                        authRegisterProvider
                                            .firstNameController
                                            .text,
                                        authRegisterProvider
                                            .lastNameController
                                            .text,
                                        authRegisterProvider
                                            .passwordController
                                            .text,
                                      );

                                      Navigator.of(context).pushAndRemoveUntil(
                                        CupertinoPageRoute(
                                          builder:
                                              (BuildContext context) =>
                                                  const LoginScreen(),
                                        ),
                                        (Route<dynamic> route) => false,
                                      );
                                    } catch (e) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text('Registration failed'),
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                          const SizedBox(height: 24),

                          // Footer Section
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
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
                                              print(
                                                "Syarat & Ketentuan diklik",
                                              );
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
              ),
            ],
          ),
        );
      },
    );
  }

  Container _buildBackground() {
    return Container(height: 181, color: AppColors.primary500);
  }
}
