import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController phoneNumberController = TextEditingController();
  final phoneNumberKey = GlobalKey<FormState>();
  final emptyFieldError = false.obs;
  final lessThan10Error = false.obs;
  String phone = "";
  String? countryCode = "+1";

  @override
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
  }

  void onClickNext() {
    if (phoneNumberKey.currentState!.validate()) {
      if (emptyFieldError.value == false && lessThan10Error.value == false && countryCode?.isNotEmpty == true) {
        final String code = countryCode! + phone;
        Get.toNamed(Routes.OTP, arguments: code);
      }
    }
  }
}
