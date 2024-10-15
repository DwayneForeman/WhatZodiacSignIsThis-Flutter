import 'package:get/get.dart';
import 'package:whatsignisthis/screens/menu/notification/notification_settings_controller.dart';

class NotificationSettingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationSettingController>(() => NotificationSettingController());
  }
}
