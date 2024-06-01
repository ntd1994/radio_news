import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_news/src/controller/player_controller.dart';
import 'package:radio_news/core/app_color.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = Get.find<PlayerController>();

    return GestureDetector(
      onTap: () {
        playerController.changeTheme();
      },
      child: Obx(() {
        bool isLightTheme = playerController.isLightTheme.value;

        return Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isLightTheme
                ? LightThemeColor.yellow
                : DarkThemeColor.primaryLight,
          ),
          child: Stack(
            children: [
              Positioned(
                left: 8,
                top: 8,
                bottom: 8,
                child: Icon(
                  Icons.dark_mode,
                  color: isLightTheme ? Colors.black54 : Colors.white,
                  size: 24,
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                bottom: 8,
                child: Icon(
                  Icons.light_mode,
                  color: isLightTheme ? Colors.white : Colors.black54,
                  size: 24,
                ),
              ),
              AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                alignment:
                    isLightTheme ? Alignment.centerLeft : Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
