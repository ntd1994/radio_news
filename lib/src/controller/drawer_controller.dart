import 'package:get/get.dart';

class MyDrawerController extends GetxController {
  RxBool isDrawerOpen = false.obs;

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }
}
