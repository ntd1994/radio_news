// lib/src/view/widget/footer_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:radio_news/src/controller/player_controller.dart';
import 'package:radio_news/core/app_asset.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final PlayerController controller = Get.find<PlayerController>();
    final bool isLightTheme = controller.isLightTheme.value;

    return Container(
        padding: const EdgeInsets.all(16.0),
        color: isLightTheme ? Colors.white : Colors.black,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Mixlr'),
          SvgPicture.asset(
            AppAsset.mixlr,
            width: 24,
            height: 24,
          )
        ]));
  }
}
