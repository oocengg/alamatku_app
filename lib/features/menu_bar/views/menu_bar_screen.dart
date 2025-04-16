import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/features/menu_bar/provider/menu_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:provider/provider.dart';

class MenuBarScreen extends StatefulWidget {
  const MenuBarScreen({super.key});

  @override
  State<MenuBarScreen> createState() => _MenuBarScreenState();
}

class _MenuBarScreenState extends State<MenuBarScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<MenuBarProvider>(
      builder: (context, menuProvider, _) {
        return BottomBar(
          fit: StackFit.expand,
          iconHeight: 24,
          iconWidth: 24,
          barDecoration: BoxDecoration(
            border: Border.all(color: AppColors.primary100),
            borderRadius: BorderRadius.circular(20),
          ),
          barColor: Colors.white,
          barAlignment: Alignment.bottomCenter,
          borderRadius: BorderRadius.circular(20),
          width: MediaQuery.of(context).size.width * 0.9,
          body: (context, controller) {
            return menuProvider.pages[menuProvider
                .selectedIndex]; // langsung pakai index
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(menuProvider.icon.length, (index) {
                final icon = menuProvider.icon[index];
                final iconActice = menuProvider.iconActive[index];
                final title = menuProvider.title[index];
                final isSelected = menuProvider.selectedIndex == index;

                return GestureDetector(
                  onTap: () async {
                    // await homeProvider.buildPage(context);
                    // if (!mounted) return;

                    // if (index == 0) {
                    //   menuProvider.setSelectedIndex(context, index);
                    // } else if (homeProvider.isLoggedIn) {
                    //   menuProvider.setSelectedIndex(context, index);
                    // } else {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //       builder: (context) => const AuthScreen(),
                    //     ),
                    //   );
                    // }
                    menuProvider.setSelectedIndex(context, index);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isSelected ? iconActice : icon,
                        color:
                            isSelected
                                ? AppColors.primary500
                                : AppColors.primary100,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color:
                              isSelected
                                  ? AppColors.primary500
                                  : AppColors.primary100,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
