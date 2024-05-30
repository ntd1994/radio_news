import 'package:get/get.dart';
//import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:radio_news/core/app_size.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radio_news/core/app_asset.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:radio_news/core/app_data.dart';
import 'package:radio_news/core/app_color.dart';
//import 'package:radio_news/core/app_extension.dart';
//import 'package:radio_news/src/model/food_category.dart';
import 'package:radio_news/src/controller/food_controller.dart';
//import 'package:radio_news/src/view/widget/food_list_view.dart';

final FoodController controller = Get.put(FoodController());

class RecordingListScreen extends StatelessWidget {
  const RecordingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              height: size.height * RecordingListViewSize.header,
              child: const HeaderContainer(),
            ),
            SizedBox(
              height: size.height * RecordingListViewSize.recording,
              child: SvgPicture.asset(
                AppAsset.recordingBG,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: DarkThemeColor.lineColor,
            width: RecordingListViewSize.lineWidth,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "SaigonNewsRadio",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Row(
            children: [
              Container(),
              SvgPicture.asset(
                AppAsset.userconnection,
                width: HeaderViewSize.userConnectionWidth,
                height: HeaderViewSize.userConnectionHeight,
              ),
              SvgPicture.asset(
                AppAsset.userconnection,
                width: HeaderViewSize.userConnectionWidth,
                height: HeaderViewSize.userConnectionHeight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
