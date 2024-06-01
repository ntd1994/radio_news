import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:radio_news/src/controller/player_controller.dart';
import 'package:radio_news/src/view/widget/theme_button.dart';
import 'package:radio_news/core/app_color.dart';

void main() {
  group('ThemeSwitch Widget Test', () {
    setUp(() {
      Get.put(PlayerController());
    });

    tearDown(() {
      Get.delete<PlayerController>();
    });

    testWidgets('Initial theme is light', (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: Scaffold(
            body: ThemeSwitch(),
          ),
        ),
      );

      final switchContainerFinder = find.descendant(
        of: find.byType(ThemeSwitch),
        matching: find.byType(Container),
      );

      final switchContainer = tester.widget<Container>(switchContainerFinder);
      expect((switchContainer.decoration as BoxDecoration).color,
          LightThemeColor.yellow);

      expect(find.byIcon(Icons.dark_mode), findsOneWidget);
      expect(find.byIcon(Icons.light_mode), findsOneWidget);
    });

    testWidgets('Tapping changes theme', (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: Scaffold(
            body: ThemeSwitch(),
          ),
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      final switchContainerFinder = find.descendant(
        of: find.byType(ThemeSwitch),
        matching: find.byType(Container),
      );

      final switchContainer = tester.widget<Container>(switchContainerFinder);
      expect((switchContainer.decoration as BoxDecoration).color,
          DarkThemeColor.primaryLight);

      expect(find.byIcon(Icons.dark_mode), findsOneWidget);
      expect(find.byIcon(Icons.light_mode), findsOneWidget);
    });
  });
}
