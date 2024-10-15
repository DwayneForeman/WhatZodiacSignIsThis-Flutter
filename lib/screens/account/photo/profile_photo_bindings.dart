import 'package:get/get.dart';
import 'package:whatsignisthis/screens/account/photo/profile_photo_controller.dart';

class ProfilePhotoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePhotoController>(() => ProfilePhotoController());
  }
}
