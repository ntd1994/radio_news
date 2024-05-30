import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:radio_news/src/view/screen/home_screen.dart';
import 'package:radio_news/src/controller/food_controller.dart';

final FoodController controller = Get.put(FoodController());

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        theme: controller.theme.value,
        home: HomeScreen(),
      );
    });
  }
}
