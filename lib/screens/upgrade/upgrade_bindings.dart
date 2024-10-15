import 'package:get/get.dart';
import 'package:whatsignisthis/screens/upgrade/upgrade_controller.dart';

class UpgradeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpgradeController>(() => UpgradeController());
  }
}
