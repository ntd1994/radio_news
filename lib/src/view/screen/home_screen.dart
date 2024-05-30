import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radio_news/core/app_asset.dart';
import 'package:radio_news/core/app_size.dart';
import 'package:radio_news/core/app_types.dart';
import 'package:radio_news/src/view/screen/cart_screen.dart';
import 'package:radio_news/src/view/screen/profile_screen.dart';
//import 'package:radio_news/src/controller/food_controller.dart';
import 'package:radio_news/src/controller/player_controller.dart';
import 'package:radio_news/src/view/screen/favorite_screen.dart';
import 'package:radio_news/src/view/widget/page_transition.dart';
import 'package:radio_news/src/view/screen/food_list_screen.dart';
import 'package:radio_news/src/view/screen/recording_list_screen.dart';

final PlayerController controller = Get.put(PlayerController());

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> screen = [
    const RecordingListScreen(),
    const FoodListScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MyDrawer(),
      appBar: AppBar(
        toolbarHeight: AppBarViewSize.toolBarHeight,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset(AppAsset.radioNewsLogo,
              width: AppBarViewSize.logoWidth,
              height: AppBarViewSize.logoHeight),
          SvgPicture.asset(
            AppAsset.searchIcon,
            width: AppBarViewSize.searchHeight,
            height: AppBarViewSize.searchWidth,
          ),
        ]),
      ),
      body: Obx(
        () => PageTransition(
          child: screen[controller
              .getScreenIndex()], //we have 4 screens and controler will take care of which screen should be display.
        ),
      ),
    );
    // implement hard back button in phone here.
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: const Text('Home'),
            onTap: () {
              controller.switchScreenIndex(ScreenIndex.home.index);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Event'),
            onTap: () {
              controller.switchScreenIndex(ScreenIndex.event.index);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Recording'),
            onTap: () {
              controller.switchScreenIndex(ScreenIndex.recording.index);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              controller.switchScreenIndex(ScreenIndex.about.index);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
