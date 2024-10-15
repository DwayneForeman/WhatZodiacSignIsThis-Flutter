import 'package:get/get.dart';
import 'package:whatsignisthis/screens/user/user_home_controller.dart';

class UserHomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UserHomeController>(() => UserHomeController());
  }

}