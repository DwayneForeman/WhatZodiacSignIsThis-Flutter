import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/screens/account/edit_email.dart';
import 'package:whatsignisthis/screens/account/edit_name.dart';
import 'package:whatsignisthis/services/app_service.dart';

class AccountProfileController extends GetxController {
  final settings = Get.find<AppService>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final nameKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();

  void updateName() {
    if (nameKey.currentState!.validate()) {
      settings.user.value.name = nameController.text;
      settings.updateUserProfile();
    }
  }

  void updateEmail() {
    if (emailKey.currentState!.validate()) {
      settings.user.value.email = emailController.text;
      settings.updateUserProfile();
    }
  }

  void openNameBottomSheet() {
    nameController.text = settings.user.value.name.isEmpty ? "User ${settings.user.value.serialId}" : settings.user.value.name;
    Get.bottomSheet(const EditNameBottomSheetState());
  }

  void openEmailBottomSheet() {
    emailController.text = settings.user.value.email;
    Get.bottomSheet(const EditEmailBottomSheet());
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
