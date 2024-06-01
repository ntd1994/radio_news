import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:radio_news/src/controller/player_controller.dart';
import 'package:radio_news/src/controller/food_controller.dart';
import 'package:radio_news/src/view/screen/home_screen.dart';
import 'dart:ui' show PointerDeviceKind;

void main() {
  Get.put(FoodController());
  Get.put(PlayerController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = Get.find<PlayerController>();

    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        theme: playerController.theme.value,
        home: SafeArea(
          child: HomeScreen(),
        ),
      );
    });
  }
}
