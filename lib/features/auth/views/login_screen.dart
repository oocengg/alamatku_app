import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/core/state/app_state.dart';
import 'package:alamatku_app/core/widgets/alamatku_button.dart';
import 'package:alamatku_app/core/widgets/alamatku_text_divider.dart';
import 'package:alamatku_app/core/widgets/alamatku_text_field.dart';
import 'package:alamatku_app/features/auth/provider/auth_login_provider.dart';
import 'package:alamatku_app/features/auth/views/register_screen.dart';
import 'package:alamatku_app/features/menu_bar/provider/menu_bar_provider.dart';
import 'package:alamatku_app/features/menu_bar/views/menu_bar_screen.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Consumer<AuthLoginProvider>(
      builder: (context, authLoginProvider, _) {
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
                              Image.asset(
                                height: 64,
                                'assets/images/alamatku_logo.png',
                              ),
                              const SizedBox(width: 24),
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.dark100,
                                    ),
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        BootstrapIcons.globe,
                                        size: 12,
                                        color: AppColors.dark300,
                                      ),
                                      SizedBox(width: 6),
                                      Flexible(
                                        child: Text(
                                          'Bahasa Indonesia',
                                          style: TextStyle(fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),

                          const Text(
                            'Masuk',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF202020),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Satu Aplikasi, Semua Alamatmu.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF1E1E1E),
                            ),
                          ),
                          const SizedBox(height: 44),

                          // Text Field Section
                          AlamatkuTextField(
                            placeholder: 'E-mail',
                            controller: authLoginProvider.emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email tidak boleh kosong';
                              }
                              final emailRegex = RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                              );
                              if (!emailRegex.hasMatch(value)) {
                                return 'Format email salah.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          AlamatkuTextField(
                            placeholder: 'Kata Sandi',
                            isPassword: true,
                            obscureText: true,
                            controller: authLoginProvider.passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password tidak boleh kosong';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween, // Jarak antar elemen
                            children: [
                              SizedBox(),
                              GestureDetector(
                                onTap: () {
                                  print("Lupa kata sandi? diklik");
                                },
                                child: const Text(
                                  "Lupa kata sandi?",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primary500,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),

                          // Button Section
                          authLoginProvider.loginState == AppState.loading
                              ? Center(child: const CircularProgressIndicator())
                              : AlamatkuButton(
                                text: 'Masuk',
                                backgroundColor: AppColors.primary500,
                                onPressed: () async {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    try {
                                      await authLoginProvider.loginCustomer(
                                        authLoginProvider.emailController.text,
                                        authLoginProvider
                                            .passwordController
                                            .text,
                                      );

                                      Navigator.pop(context);
                                      context
                                          .read<MenuBarProvider>()
                                          .setSelectedIndex(context, 0);

                                      Navigator.of(context).pushAndRemoveUntil(
                                        CupertinoPageRoute(
                                          builder:
                                              (BuildContext context) =>
                                                  const MenuBarScreen(),
                                        ),
                                        (Route<dynamic> route) => false,
                                      );
                                    } catch (e) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Login gagal! Periksa kembali inputan anda.',
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                          const SizedBox(height: 24),
                          const AlamatkuTextDivider(text: 'Atau masuk dengan'),
                          const SizedBox(height: 24),
                          AlamatkuButton(
                            text: 'Masuk dengan Google',
                            imagePath: 'assets/icons/google_icon.png',
                            iconSize: 24,
                            backgroundColor: AppColors.white,
                            textColor: AppColors.black,
                            outlineColor: AppColors.dark200,
                            onPressed: () {},
                          ),
                          const SizedBox(height: 32),

                          // Registration Link
                          Center(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textColorSecondary,
                                ),
                                children: [
                                  const TextSpan(text: "Belum punya akun? "),
                                  TextSpan(
                                    text: "Daftar Dulu",
                                    style: const TextStyle(
                                      color: AppColors.rose500,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.of(context).push(
                                              CupertinoPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const RegisterScreen(),
                                              ),
                                            );
                                          },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Footer Section
                          // Center(
                          //   child: Padding(
                          //     padding: const EdgeInsets.symmetric(horizontal: 10),
                          //     child: RichText(
                          //       textAlign: TextAlign.center,
                          //       text: TextSpan(
                          //         style: const TextStyle(
                          //           fontSize: 12,
                          //           color: Colors.black87,
                          //           height: 1.5,
                          //         ),
                          //         children: [
                          //           const TextSpan(text: "Saya setuju dengan "),
                          //           TextSpan(
                          //             text: "Syarat & Ketentuan",
                          //             style: const TextStyle(
                          //               color: Colors.blue,
                          //               fontWeight: FontWeight.bold,
                          //             ),
                          //             recognizer:
                          //                 TapGestureRecognizer()
                          //                   ..onTap = () {
                          //                     print("Syarat & Ketentuan diklik");
                          //                   },
                          //           ),
                          //           const TextSpan(text: " serta "),
                          //           TextSpan(
                          //             text: "Kebijakan Privasi ",
                          //             style: const TextStyle(
                          //               color: Colors.blue,
                          //               fontWeight: FontWeight.bold,
                          //             ),
                          //             recognizer:
                          //                 TapGestureRecognizer()
                          //                   ..onTap = () {
                          //                     print("Kebijakan Privasi diklik");
                          //                   },
                          //           ),
                          //           const TextSpan(
                          //             text: "Majadigi Provinsi Jawa Timur",
                          //             style: TextStyle(
                          //               fontSize: 12,
                          //               color: Colors.black87,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
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
