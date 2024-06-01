import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:radio_news/core/app_color.dart';
import 'package:radio_news/src/model/theme.dart';
import 'package:radio_news/src/controller/theme_controller.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Obx(() {
      bool isDarkMode =
          themeController.themeModel.value.currentTheme == ThemeType.dark;

      return Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isDarkMode ? Colors.grey : Colors.yellow,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: isDarkMode ? 40 : 10,
              right: isDarkMode ? 10 : 40,
              child: GestureDetector(
                onTap: themeController.toggleTheme,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: isDarkMode ? Colors.black : Colors.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
