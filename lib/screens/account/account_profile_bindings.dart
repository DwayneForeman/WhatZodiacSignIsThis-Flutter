import 'package:get/get.dart';
import 'package:whatsignisthis/screens/account/account_profile_controller.dart';

class AccountProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountProfileController>(() => AccountProfileController());
  }
}
