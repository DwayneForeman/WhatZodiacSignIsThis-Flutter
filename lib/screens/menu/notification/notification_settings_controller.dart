import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/services/app_service.dart';

enum SingingCharacter { on, off }

class NotificationSettingController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final selectedValue = "Allow".obs;

  late AppService settings;

  @override
  void onInit() {
    settings = Get.find<AppService>();
    selectedValue.value = settings.notify.value ? "Allow" : "Disable";
    super.onInit();
  }
}
