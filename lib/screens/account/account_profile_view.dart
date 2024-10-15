import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/routes/app_pages.dart';
import 'package:whatsignisthis/screens/account/account_profile_controller.dart';

class AccountProfileView extends GetView<AccountProfileController> {
  const AccountProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff6A11CB), Color(0xff2575FC)], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Obx(
                () => Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_back, color: Colors.white, size: MediaQuery.of(context).size.width * 0.077),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Account",
                        style: TextStyle(
                            fontFamily: "SF-Compact",
                            fontWeight: FontWeight.w900,
                            color: const Color(0xffffffff),
                            fontSize: MediaQuery.of(context).size.width * 0.088),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.925,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width * 0.80,
                              decoration: BoxDecoration(color: const Color(0x15ffffff), borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.width * 0.2),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 30),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/images/name-card-icon.png",
                                            width: MediaQuery.of(context).size.width * 0.056,
                                            height: MediaQuery.of(context).size.width * 0.056),
                                        const SizedBox(width: 15),
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                fontFamily: "SF-Compact",
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xffffffff),
                                                fontSize: MediaQuery.of(context).size.width * 0.067),
                                            children: [
                                              const TextSpan(text: "Name\n"),
                                              TextSpan(
                                                text: controller.settings.user.value.name.isEmpty
                                                    ? "User ${controller.settings.user.value.serialId}"
                                                    : controller.settings.user.value.name,
                                                style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.width * 0.034,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color(0x90ffffff),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                            onTap: () => controller.openNameBottomSheet(),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Icon(Icons.edit, color: Colors.white, size: MediaQuery.of(context).size.width * 0.047),
                                            ))
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.width * 0.069),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 30),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/images/phone-icon.png",
                                            width: MediaQuery.of(context).size.width * 0.05,
                                            height: MediaQuery.of(context).size.width * 0.05),
                                        const SizedBox(width: 15),
                                        RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: "SF-Compact",
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color(0xffffffff),
                                                    fontSize: MediaQuery.of(context).size.width * 0.067),
                                                children: [
                                              const TextSpan(text: "Mobile Number\n"),
                                              TextSpan(
                                                  text: controller.settings.user.value.phone,
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.width * 0.034,
                                                      fontWeight: FontWeight.w600,
                                                      color: const Color(0x90ffffff)))
                                            ])),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.width * 0.069),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 30),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/images/email-icon.png",
                                            width: MediaQuery.of(context).size.width * 0.053,
                                            height: MediaQuery.of(context).size.width * 0.036),
                                        const SizedBox(width: 15),
                                        RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: "SF-Compact",
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color(0xffffffff),
                                                    fontSize: MediaQuery.of(context).size.width * 0.067),
                                                children: [
                                              const TextSpan(text: "Email\n"),
                                              TextSpan(
                                                  text: controller.settings.user.value.email,
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.width * 0.034,
                                                      fontWeight: FontWeight.w600,
                                                      color: const Color(0x90ffffff)))
                                            ])),
                                        const Spacer(),
                                        GestureDetector(
                                            onTap: () => controller.openEmailBottomSheet(),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Icon(Icons.edit, color: Colors.white, size: MediaQuery.of(context).size.width * 0.047),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            child: Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.285,
                                height: MediaQuery.of(context).size.width * 0.285,
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.28,
                                      height: MediaQuery.of(context).size.width * 0.28,
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
                                    Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: () => Get.toNamed(Routes.PROFILE_PHOTO),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.1,
                                            height: MediaQuery.of(context).size.width * 0.1,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: LinearGradient(colors: [Color(0xff6A11CB), Color(0xff2575FC)])),
                                            child: Center(
                                                child: Icon(
                                              Icons.edit,
                                              size: MediaQuery.of(context).size.width * 0.047,
                                              color: Colors.white,
                                            )),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () => showResponseDialog(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/delete-icon.png",
                            width: MediaQuery.of(context).size.width * 0.067,
                            height: MediaQuery.of(context).size.width * 0.067,
                          ),
                          const SizedBox(width: 10),
                          Text("DELETE ACCOUNT",
                              style: TextStyle(
                                  fontFamily: "SF-Compact",
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xffffffff),
                                  fontSize: MediaQuery.of(context).size.width * 0.034)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    if (controller.settings.deleteWarning)
                      Text("This operation is sensitive and requires recent login. Please logout and login again to delete your account.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "SF-Compact",
                              fontWeight: FontWeight.normal,
                              color: const Color.fromARGB(255, 116, 1, 1),
                              fontSize: MediaQuery.of(context).size.width * 0.034)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showResponseDialog() {
    Get.dialog(
     Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 80),
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: Get.mediaQuery.size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Color(0xff6A11CB), Color(0xff2575FC)],
            )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(Icons.close, color: Colors.white, size: Get.mediaQuery.size.width * 0.082),
                    )),
                const SizedBox(height: 20),
                const Text("Are you sure you want to delete your account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w600, color: Colors.white, fontSize: 22)),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    controller.settings.deleteAccount();
                  },
                  child: Container(
                    width: 118,
                    height: 52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                            colors: [Color(0xff434343), Color(0xff000000)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                    child: const Center(
                        child: Text("Yes",
                            style:
                                TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffF2F2F2), fontSize: 16))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  SnackBar accountDeleteWarningSnackBar() {
    return SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
        padding: EdgeInsets.zero,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        width: Get.mediaQuery.size.width * 0.8,
        content: Container(
          width: Get.mediaQuery.size.width * 0.8,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  colors: [Color(0xffF78CA0), Color(0xffF9748F), Color(0xffFD868C)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(width: 20),
              Icon(Icons.close, color: Colors.white, size: 20),
              Spacer(),
              Text("This operation is sensitive and requires recent login. Please logout and login again to delete your account.",
                  style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w600, color: Color(0xffffffff), fontSize: 16)),
              Spacer(),
              SizedBox(width: 20)
            ],
          ),
        ));
  }
}
