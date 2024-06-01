import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_news/src/controller/player_controller.dart';
import 'package:radio_news/core/app_types.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final PlayerController controller = Get.find<PlayerController>();
    final bool isLightTheme = controller.isLightTheme.value;

    return Drawer(
      backgroundColor: isLightTheme ? Colors.white : Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.close, size: 12),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: Text(
                    'Home',
                    style: TextStyle(
                        color: isLightTheme ? Colors.black : Colors.white),
                  ),
                  onTap: () {
                    controller.switchScreenIndex(ScreenIndex.home.index);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Event',
                    style: TextStyle(
                        color: isLightTheme ? Colors.black : Colors.white),
                  ),
                  onTap: () {
                    controller.switchScreenIndex(ScreenIndex.event.index);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Recording',
                    style: TextStyle(
                        color: isLightTheme ? Colors.black : Colors.white),
                  ),
                  onTap: () {
                    controller.switchScreenIndex(ScreenIndex.recording.index);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'About',
                    style: TextStyle(
                        color: isLightTheme ? Colors.black : Colors.white),
                  ),
                  onTap: () {
                    controller.switchScreenIndex(ScreenIndex.about.index);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
