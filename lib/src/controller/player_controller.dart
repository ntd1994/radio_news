import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:radio_news/core/app_theme.dart';
import 'package:radio_news/core/app_types.dart';

class PlayerController extends GetxController {
  RxList<int> screenIndex = <int>[].obs;
  Rx<ThemeData> theme = AppTheme.lightTheme.obs;
  RxBool isLightTheme = true.obs;

  // Add screen index to list, in case list is full, remove the first and add the last one.
  void switchScreenIndex(int currentIndex) {
    const int maxUndoScreen = 5;
    const int firstElementIndex = 0;
    if (screenIndex.isEmpty) {
      screenIndex.add(currentIndex);
      return;
    }

    if (screenIndex.last == currentIndex) {
      return;
    }

    if (screenIndex.length >= maxUndoScreen) {
      screenIndex.removeAt(firstElementIndex);
    }
    screenIndex.add(currentIndex);
  }

  int getScreenIndex() {
    if (screenIndex.isEmpty) {
      return ScreenIndex.home.index;
    }
    return screenIndex.last;
  }

  void changeTheme() {
    if (theme.value == AppTheme.darkTheme) {
      theme.value = AppTheme.lightTheme;
      isLightTheme.value = true;
    } else {
      theme.value = AppTheme.darkTheme;
      isLightTheme.value = false;
    }
    update();
  }
}
