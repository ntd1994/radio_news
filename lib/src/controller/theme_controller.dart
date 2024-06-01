import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_news/src/model/theme.dart';

class ThemeController extends GetxController {
  var themeModel = ThemeModel(ThemeType.light).obs;

  void toggleTheme() {
    if (themeModel.value.currentTheme == ThemeType.light) {
      themeModel.value = ThemeModel(ThemeType.dark);
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      themeModel.value = ThemeModel(ThemeType.light);
      Get.changeThemeMode(ThemeMode.light);
    }
  }
}
