import 'package:get/get.dart';
import 'package:whatsignisthis/screens/menu/contact/contact_us_controller.dart';

class ContactUsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsController>(() => ContactUsController());
  }
}
