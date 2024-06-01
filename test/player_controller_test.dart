import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:radio_news/core/app_theme.dart';
import 'package:radio_news/src/controller/player_controller.dart';

void main() {
  group('PlayerController Test', () {
    late PlayerController controller;

    setUp(() {
      controller = Get.put(PlayerController());
    });

    tearDown(() {
      Get.delete<PlayerController>();
    });

    test('Initial values are correct', () {
      expect(controller.screenIndex.isEmpty, true);
      expect(controller.theme.value, AppTheme.lightTheme);
      expect(controller.isLightTheme.value, true);
    });

    test('Switch theme from light to dark', () {
      controller.changeTheme();
      expect(controller.theme.value, AppTheme.darkTheme);
      expect(controller.isLightTheme.value, false);
    });

    test('Switch theme from dark to light', () {
      controller.changeTheme();
      controller.changeTheme();
      expect(controller.theme.value, AppTheme.lightTheme);
      expect(controller.isLightTheme.value, true);
    });

    test('Switch screen index', () {
      controller.switchScreenIndex(1);
      expect(controller.screenIndex.last, 1);

      controller.switchScreenIndex(2);
      expect(controller.screenIndex.last, 2);

      controller.switchScreenIndex(1);
      expect(controller.screenIndex.last, 1);
    });
  });
}
