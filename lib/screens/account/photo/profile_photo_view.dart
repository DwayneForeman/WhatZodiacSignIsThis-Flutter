import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsignisthis/screens/account/photo/profile_photo_controller.dart';

class ProfilePhotoView extends GetView<ProfilePhotoController> {
  const ProfilePhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xff6A11CB), Color(0xff2575FC)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Align(alignment: Alignment.centerLeft, child: Icon(Icons.arrow_back, color: Colors.white, size: 24)),
                  ),
                  const SizedBox(height: 25),
                  const Text("Profile Photo",
                      style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 32)),
                  const SizedBox(height: 20),
                  Obx(
                    () => SizedBox(
                      width: 140,
                      height: 140,
                      child: controller.settings.user.value.imageUrl.contains("http")
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(controller.settings.user.value.imageUrl),
                              radius: 48.0,
                            )
                          : controller.settings.user.value.imageUrl.contains("assets")
                              ? CircleAvatar(
                                  backgroundImage: AssetImage(controller.settings.user.value.imageUrl),
                                  radius: 48.0,
                                )
                              : const CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/default_dp.png"),
                                  radius: 48.0,
                                ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text("Select Your Photo",
                      style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 24)),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 225,
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                      children: [
                        GestureDetector(
                            onTap: () => showResponseDialog(), child: Image.asset("assets/images/camera.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar22.png"),
                            child: Image.asset("assets/images/avatar22.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar02.png"),
                            child: Image.asset("assets/images/avatar02.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar23.png"),
                            child: Image.asset("assets/images/avatar23.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar03.png"),
                            child: Image.asset("assets/images/avatar03.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar24.png"),
                            child: Image.asset("assets/images/avatar24.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar04.png"),
                            child: Image.asset("assets/images/avatar04.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar25.png"),
                            child: Image.asset("assets/images/avatar25.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar05.png"),
                            child: Image.asset("assets/images/avatar05.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar26.png"),
                            child: Image.asset("assets/images/avatar26.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar06.png"),
                            child: Image.asset("assets/images/avatar06.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar27.png"),
                            child: Image.asset("assets/images/avatar27.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar07.png"),
                            child: Image.asset("assets/images/avatar07.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar28.png"),
                            child: Image.asset("assets/images/avatar28.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar08.png"),
                            child: Image.asset("assets/images/avatar08.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar29.png"),
                            child: Image.asset("assets/images/avatar29.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar09.png"),
                            child: Image.asset("assets/images/avatar09.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar30.png"),
                            child: Image.asset("assets/images/avatar30.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar10.png"),
                            child: Image.asset("assets/images/avatar10.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar31.png"),
                            child: Image.asset("assets/images/avatar31.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar11.png"),
                            child: Image.asset("assets/images/avatar11.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar32.png"),
                            child: Image.asset("assets/images/avatar32.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar12.png"),
                            child: Image.asset("assets/images/avatar12.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar33.png"),
                            child: Image.asset("assets/images/avatar33.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar13.png"),
                            child: Image.asset("assets/images/avatar13.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar34.png"),
                            child: Image.asset("assets/images/avatar34.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar14.png"),
                            child: Image.asset("assets/images/avatar14.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar35.png"),
                            child: Image.asset("assets/images/avatar35.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar15.png"),
                            child: Image.asset("assets/images/avatar15.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar36.png"),
                            child: Image.asset("assets/images/avatar36.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar16.png"),
                            child: Image.asset("assets/images/avatar16.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar37.png"),
                            child: Image.asset("assets/images/avatar37.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar17.png"),
                            child: Image.asset("assets/images/avatar17.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar38.png"),
                            child: Image.asset("assets/images/avatar38.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar18.png"),
                            child: Image.asset("assets/images/avatar18.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar39.png"),
                            child: Image.asset("assets/images/avatar39.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar19.png"),
                            child: Image.asset("assets/images/avatar19.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar40.png"),
                            child: Image.asset("assets/images/avatar40.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar20.png"),
                            child: Image.asset("assets/images/avatar20.png", width: 106, height: 106)),
                        GestureDetector(
                            onTap: () => controller.selectedAvatar("assets/images/avatar21.png"),
                            child: Image.asset("assets/images/avatar21.png", width: 106, height: 106)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showResponseDialog() async {
    final ImagePicker imgPicker = ImagePicker();

    Get.defaultDialog(
      title: "Choose Option",
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  Get.back();
                  final pickedFile = await imgPicker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    controller.uploadImage(pickedFile.path);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Take a Photo",
                        style: TextStyle(fontFamily: "SF-Pro", fontWeight: FontWeight.w600, color: Color(0xff000000), fontSize: 14)),
                    Icon(Icons.camera_alt, color: Colors.black, size: 18),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Divider(
                thickness: 0.5,
                color: Color(0x20000000),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () async {
                  Get.back();
                  final pickedFile = await imgPicker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    controller.uploadImage(pickedFile.path);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Select From Camera Roll",
                        style: TextStyle(fontFamily: "SF-Pro", fontWeight: FontWeight.w600, color: Color(0xff000000), fontSize: 14)),
                    Image.asset("assets/images/gallery.png", width: 15, height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
