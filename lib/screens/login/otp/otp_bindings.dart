import 'package:get/get.dart';
import 'package:whatsignisthis/screens/login/otp/otp_controller.dart';

class OTPBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPController>(() => OTPController());
  }
}
