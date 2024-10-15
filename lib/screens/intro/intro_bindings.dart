import 'package:get/get.dart';
import 'package:whatsignisthis/screens/intro/intro_controller.dart';

class IntroBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(() => IntroController());
  }
}
