import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/core/state/app_state.dart';
import 'package:alamatku_app/core/widgets/alamatku_button.dart';
import 'package:alamatku_app/features/auth/views/login_screen.dart';
import 'package:alamatku_app/features/profile/provider/profile_provider.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().setData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProfileProvider>(
        builder: (context, profileProvider, _) {
          return SafeArea(
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
                    '${profileProvider.firstName ?? '-'} ${profileProvider.lastName ?? '-'}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Email Pengguna
                  Text(
                    profileProvider.email ?? '-',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),

                  // Nomor Telepon Pengguna
                  Text(
                    profileProvider.custId ?? '-',
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

                  profileProvider.logoutState == AppState.loading
                      ? Center(child: const CircularProgressIndicator())
                      : AlamatkuButton(
                        text: 'Keluar',
                        onPressed: () async {
                          final isSuccess = await profileProvider.logout();

                          if (isSuccess) {
                            Navigator.of(context).pushAndRemoveUntil(
                              CupertinoPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Logout gagal, coba lagi.'),
                              ),
                            );
                          }
                        },
                        backgroundColor: AppColors.rose500,
                      ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
