import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:radio_news/core/app_asset.dart';
import 'package:radio_news/core/app_size.dart';
import 'package:radio_news/src/view/screen/cart_screen.dart';
import 'package:radio_news/src/view/screen/profile_screen.dart';
import 'package:radio_news/src/controller/player_controller.dart';
import 'package:radio_news/src/view/screen/favorite_screen.dart';
// import 'package:radio_news/src/controller/drawer_controller.dart';
import 'package:radio_news/src/view/widget/page_transition.dart';
import 'package:radio_news/src/view/screen/food_list_screen.dart';
import 'package:radio_news/src/view/screen/recording_list_screen.dart';
import 'package:radio_news/src/view/widget/theme_button.dart';
import 'package:radio_news/src/view/widget/drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PlayerController controller = Get.put(PlayerController());
  // final MyDrawerController drawerController = Get.put(MyDrawerController());

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(AppAsset.radioNewsLogo,
                width: AppBarViewSize.logoWidth,
                height: AppBarViewSize.logoHeight),
            SvgPicture.asset(
              AppAsset.searchIcon,
              width: AppBarViewSize.searchWidth,
              height: AppBarViewSize.searchHeight,
            ),
            const SizedBox(
              width: 80,
              height: 40,
              child: ThemeSwitch(),
            ),
          ],
        ),
      ),
      body: Obx(
        () => PageTransition(
          child: screen[controller.screenIndex.isNotEmpty
              ? controller.screenIndex.first
              : 0],
        ),
      ),
    );
  }
}
