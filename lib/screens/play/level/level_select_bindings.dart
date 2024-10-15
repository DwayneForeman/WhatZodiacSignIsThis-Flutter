import 'package:get/get.dart';
import 'package:whatsignisthis/screens/play/level/level_select_controller.dart';

class LevelSelectBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelSelectController>(() => LevelSelectController());
  }
}
