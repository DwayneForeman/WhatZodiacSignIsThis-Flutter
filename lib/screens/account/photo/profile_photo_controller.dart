import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/services/app_service.dart';
import 'package:whatsignisthis/utils/table_collection.dart';
import 'package:whatsignisthis/utils/utils.dart';

class ProfilePhotoController extends GetxController {
  final settings = Get.find<AppService>();
  late FirebaseStorage _storage;

  ProfilePhotoController() {
    _storage = FirebaseStorage.instance;
  }

  void selectedAvatar(String avatarPath) {
    settings.user.value.imageUrl = avatarPath;
    settings.updateUserProfile();
  }

  void uploadImage(String filePath) {
    if (filePath.isNotEmpty) {
      Utils.showProgressDialog("Please wait...");
      final metadata = SettableMetadata(
        contentType: 'image/png',
        customMetadata: {'picked-file-path': filePath},
      );
      var fileName = "${settings.user.value.uid}.${filePath.split(".").last}";
      _storage.ref().child(TableCollection.profileBucket).child("/$fileName").putFile(File(filePath), metadata).then((snapshot) async {
        snapshot.ref.getDownloadURL().then((url) {
          if (Get.isDialogOpen == true) {
            Get.back();
          }
          settings.user.value.imageUrl = url;
          settings.updateUserProfile();
        }).onError((error, stackTrace) {
          if (Get.isDialogOpen == true) {
            Get.back();
          }
        });
      }).onError((error, stackTrace) {
        if (Get.isDialogOpen == true) {
          Get.back();
        }
      });
    }
  }
}
