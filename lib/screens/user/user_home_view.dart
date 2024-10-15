import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:whatsignisthis/routes/app_pages.dart';
import 'package:whatsignisthis/screens/user/user_home_controller.dart';
import 'package:whatsignisthis/services/app_service.dart';
import 'package:whatsignisthis/utils/snack_util.dart';

class UserHomeView extends GetView<UserHomeController> {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.mediaQuery.size.width,
          //height: Get.mediaQuery.size.height,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/levels-texture.png"), fit: BoxFit.fill)),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => controller.settings.toggleMusic(),
                        child: Obx(
                          () => Image.asset(
                            Get.find<AppService>().music.value ? "assets/images/sound-on-icon.png" : "assets/images/sound-off-icon.png",
                            width: Get.mediaQuery.size.width * 0.068,
                            height: Get.mediaQuery.size.width * 0.068,
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.LEADER_BORD),
                        child: Image.asset("assets/images/leaderboard-icon.png",
                            width: Get.mediaQuery.size.width * 0.11, height: Get.mediaQuery.size.width * 0.11),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () => Get.bottomSheet(
                          Container(
                            decoration: BoxDecoration(color: const Color(0x15ffffff), borderRadius: BorderRadius.circular(30)),
                            child: SafeArea(
                              child: SingleChildScrollView(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [Color(0xff9B51E0), Color(0xff2575FC)]),
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(30),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset("assets/images/Home-Icon.png", width: 38, height: 38),
                                            const SizedBox(width: 12),
                                            ShaderMask(
                                              shaderCallback: (Rect bounds) {
                                                return const LinearGradient(
                                                  colors: [Color(0xff434343), Color(0xff000000)],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                ).createShader(bounds);
                                              },
                                              child: const Text("Home",
                                                  style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Colors.white, fontSize: 27)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        MenuRow(
                                          title: "Account",
                                          iconPath: "assets/images/person-icon.png",
                                          iconSize: 38,
                                          onClick: () => Get.toNamed(Routes.ACCOUNT_PROFILE),
                                        ),
                                        MenuRow(
                                            title: "Notifications",
                                            iconPath: "assets/images/bell-icon.png",
                                            iconSize: 30,
                                            onClick: () => Get.toNamed(Routes.NOTIFICATION_SETTINGS)),
                                        MenuRow(
                                            title: "How To Play",
                                            iconPath: "assets/images/question-circle.png",
                                            iconSize: 30,
                                            onClick: () => Get.toNamed(Routes.HOW_TO_PLAY)),
                                        MenuRow(
                                            title: "About Us",
                                            iconPath: "assets/images/about-icon.png",
                                            iconSize: 35,
                                            onClick: () => Get.toNamed(Routes.ABOUT)),
                                        MenuRow(
                                            title: "Rate Us",
                                            iconPath: "assets/images/star-icon.png",
                                            iconSize: 40,
                                            onClick: () => Get.toNamed(Routes.RATE_US)),
                                        MenuRow(
                                          title: "Share App",
                                          iconPath: "assets/images/share-icon.png",
                                          iconSize: 30,
                                          onClick: () => SnackUtil.share(),
                                        ),
                                        MenuRow(
                                          title: "Restore Purchase",
                                          iconPath: "assets/images/restore-icon.png",
                                          iconSize: 29,
                                          onClick: () => {controller.restorePurchase()},
                                        ),
                                        MenuRow(
                                          title: "Logout",
                                          iconPath: "assets/images/logout-icon.png",
                                          iconSize: 25,
                                          onClick: () => Get.defaultDialog(
                                            title: "",
                                            content: Dialog(
                                              backgroundColor: Colors.transparent,
                                              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
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
                                                              onTap: () => Navigator.pop(context),
                                                              child: Icon(Icons.close, color: Colors.white, size: Get.mediaQuery.size.width * 0.082),
                                                            )),
                                                        const SizedBox(height: 20),
                                                        const Text("Are you sure you want to logout?",
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                fontFamily: "SF-Compact", fontWeight: FontWeight.w600, color: Colors.white, fontSize: 22)),
                                                        const SizedBox(height: 20),
                                                        GestureDetector(
                                                          onTap: () async {
                                                            await controller.settings.auth.signOut().then((value) => Get.offAllNamed(Routes.HOME));
                                                          },
                                                          child: Container(
                                                            width: 118,
                                                            height: 52,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(15),
                                                                gradient: const LinearGradient(
                                                                    colors: [Color(0xff434343), Color(0xff000000)],
                                                                    begin: Alignment.centerLeft,
                                                                    end: Alignment.centerRight)),
                                                            child: const Center(
                                                                child: Text("Yes",
                                                                    style: TextStyle(
                                                                        fontFamily: "SF-Compact",
                                                                        fontWeight: FontWeight.w900,
                                                                        color: Color(0xffF2F2F2),
                                                                        fontSize: 16))),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            barrierDismissible: false,
                                            backgroundColor: Colors.transparent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          isScrollControlled: true,
                        ),
                        child: Image.asset("assets/images/menu-icon.png", width: Get.mediaQuery.size.width * 0.11, height: Get.mediaQuery.size.width * 0.11),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Home",
                      style: TextStyle(
                          fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: const Color(0xffffffff), fontSize: Get.mediaQuery.size.width * 0.088),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Obx(
                    () => SizedBox(
                      height: Get.mediaQuery.size.width * 0.89,
                      width: Get.mediaQuery.size.width,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              width: Get.mediaQuery.size.width,
                              height: Get.mediaQuery.size.width * 0.735,
                              decoration: BoxDecoration(color: const Color(0x15ffffff), borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: Get.mediaQuery.size.width * 0.16),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            controller.settings.user.value.name.isEmpty
                                                ? "User ${controller.settings.user.value.serialId}"
                                                : controller.settings.user.value.name,
                                            style: TextStyle(
                                                fontFamily: "SF-Compact",
                                                fontWeight: FontWeight.w900,
                                                color: const Color(0xffffffff),
                                                fontSize: Get.mediaQuery.size.width * 0.067)),
                                        const SizedBox(width: 5),
                                        GestureDetector(
                                            onTap: () => Get.toNamed(Routes.ACCOUNT_PROFILE),
                                            child: Icon(
                                              Icons.edit,
                                              size: Get.mediaQuery.size.width * 0.055,
                                              color: Colors.white,
                                            ))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  Container(
                                    width: Get.mediaQuery.size.width * 0.8,
                                    height: Get.mediaQuery.size.width * 0.29,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: const LinearGradient(
                                            colors: [Color(0xff6A11CB), Color(0xff2575FC)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star_border_rounded, color: Colors.white, size: Get.mediaQuery.size.width * 0.078),
                                            Text("Points",
                                                style: TextStyle(
                                                    fontFamily: "SF-Compact",
                                                    fontWeight: FontWeight.w900,
                                                    color: const Color(0x90ffffff),
                                                    fontSize: Get.mediaQuery.size.width * 0.033)),
                                            const SizedBox(height: 3),
                                            Text(controller.settings.totalPoints.value.toString(),
                                                style: TextStyle(
                                                    fontFamily: "SF-Compact",
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color(0xffffffff),
                                                    fontSize: Get.mediaQuery.size.width * 0.045)),
                                          ],
                                        ),
                                        Container(
                                          width: 1,
                                          height: Get.mediaQuery.size.width * 0.19,
                                          decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [Color(0x10ffffff), Color(0x50ffffff), Color(0x10ffffff)],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter)),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/images/globe-icon.png",
                                                width: Get.mediaQuery.size.width * 0.065, height: Get.mediaQuery.size.width * 0.065),
                                            const SizedBox(height: 3),
                                            Text("Rank",
                                                style: TextStyle(
                                                    fontFamily: "SF-Compact",
                                                    fontWeight: FontWeight.w900,
                                                    color: const Color(0x90ffffff),
                                                    fontSize: Get.mediaQuery.size.width * 0.033)),
                                            const SizedBox(height: 3),
                                            Text("#${NumberFormat.decimalPattern().format(controller.settings.rank.value)}",
                                                style: TextStyle(
                                                    fontFamily: "SF-Compact",
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color(0xffffffff),
                                                    fontSize: Get.mediaQuery.size.width * 0.045)),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            child: Center(
                              child: GestureDetector(
                                onTap: (() => Get.toNamed(Routes.ACCOUNT_PROFILE)),
                                child: SizedBox(
                                  width: Get.mediaQuery.size.width * 0.28,
                                  height: Get.mediaQuery.size.width * 0.28,
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
                                              radius: 50.0,
                                            ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.LEVEL_SELECT),
                    child: Container(
                      width: Get.mediaQuery.size.width,
                      height: Get.mediaQuery.size.width * 0.25,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0x10ffffff)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/Emoji.png", width: Get.mediaQuery.size.width * 0.122, height: Get.mediaQuery.size.width * 0.122),
                          const SizedBox(width: 20),
                          Text("Let's Play",
                              style: TextStyle(fontFamily: "Cherry", color: const Color(0xffffffff), fontSize: Get.mediaQuery.size.width * 0.0885))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => playWithFriends(),
                    child: Container(
                      width: Get.mediaQuery.size.width,
                      height: Get.mediaQuery.size.width * 0.36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient:
                              const LinearGradient(colors: [Color(0xffB721FF), Color(0xff21D4FD)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/boy-emoji.png", width: Get.mediaQuery.size.width * 0.195, height: Get.mediaQuery.size.width * 0.195),
                              const SizedBox(width: 20),
                              Image.asset("assets/images/girl-emoji.png", width: Get.mediaQuery.size.width * 0.195, height: Get.mediaQuery.size.width * 0.195),
                            ],
                          ),
                          // const SizedBox(height: 10),
                          Text("Play with Friends",
                              style: TextStyle(fontFamily: "Cherry", color: const Color(0xffffffff), fontSize: Get.mediaQuery.size.width * 0.055))
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => controller.bannerLoaded.value
                        ? Container(
                            margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                            color: Colors.transparent,
                            width: controller.bannerAd!.size.width.toDouble(),
                            height: controller.bannerAd!.size.height.toDouble(),
                            child: AdWidget(ad: controller.bannerAd!),
                          )
                        : const SizedBox(
                            width: 1,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void playWithFriends() {
    showDialog(
      context: Get.context!,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
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
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: Get.mediaQuery.size.width * 0.082,
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/boy-emoji.png", width: Get.mediaQuery.size.width * 0.2, height: Get.mediaQuery.size.width * 0.2),
                          Image.asset("assets/images/girl-emoji.png", width: Get.mediaQuery.size.width * 0.2, height: Get.mediaQuery.size.width * 0.2),
                        ],
                      ),
                      SizedBox(height: Get.mediaQuery.size.width * 0.0425),
                      Text(
                        "Play with Friends",
                        style: TextStyle(
                          fontFamily: "Cherry",
                          color: const Color(0xffffffff),
                          fontSize: Get.mediaQuery.size.width * 0.065,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: Get.mediaQuery.size.width * 0.056),
                  Stack(
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [Color(0xffB721FF), Color(0xff21D4FD)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds);
                        },
                        child: Text(
                          "COMING SOON...",
                          style: TextStyle(
                            fontFamily: "Cherry",
                            fontSize: Get.mediaQuery.size.width * 0.088,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "COMING SOON...",
                        style: TextStyle(
                          fontFamily: "Cherry",
                          fontSize: Get.mediaQuery.size.width * 0.088,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = const Color(
                              0xffF2F2F2,
                            ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.mediaQuery.size.width * 0.0425),
                  Form(
                    key: controller.emailKey,
                    child: Container(
                      // width: Get.mediaQuery.size.width * 0.7,
                      // height: Get.mediaQuery.size.width * 0.16,
                      decoration: BoxDecoration(
                        color: const Color(0x30ffffff),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.only(bottom: 8,left: 5,right: 5),
                        child: TextFormField(
                              controller: controller.emailController,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.center,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email To Save";
                            }else  if (!GetUtils.isEmail(value)) {
                              return "Enter Correct Email";
                            }
                            return null;
                          },
                             // initialValue: controller.settings.user.value.email,
                              style: TextStyle(
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff000000),
                                fontSize: Get.mediaQuery.size.width * 0.056,
                              ),
                              decoration: InputDecoration(
                                //contentPadding: const EdgeInsets.only(left: 5, right: 5),
                                border: InputBorder.none,
                                hintText: "user@example.com",
                                hintStyle: TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff000000),
                                  fontSize: Get.mediaQuery.size.width * 0.056,
                                ),
                              ),
                          ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.mediaQuery.size.width * 0.056),
                  Text("Add your Email to be notified of release date",
                      style: TextStyle(fontFamily: "Avenir", fontWeight: FontWeight.w500, color: Colors.white, fontSize: Get.mediaQuery.size.width * 0.031)),
                  SizedBox(height: Get.mediaQuery.size.width * 0.07),
                  GestureDetector(
                    onTap: () {
                      if(controller.emailKey.currentState!.validate()){
                        controller.updateEmail();
                        Timer(const Duration(seconds: 2), () {
                          Get.back();
                        });
                      }
                    },
                    child: Container(
                      width: Get.mediaQuery.size.width * 0.327,
                      height: Get.mediaQuery.size.width * 0.145,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient:
                              const LinearGradient(colors: [Color(0xff434343), Color(0xff000000)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                      child: Center(
                        child: Text(
                          "Add Me!",
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: Get.mediaQuery.size.width * 0.045,
                          ),
                        ),
                      ),
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
}

class MenuRow extends StatelessWidget {
  const MenuRow({super.key, required this.title, required this.iconPath, required this.iconSize, this.onClick});
  final String iconPath;
  final String title;
  final double iconSize;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: onClick,
        child: Row(
          children: [
            Image.asset(iconPath, width: iconSize, height: iconSize),
            const SizedBox(width: 12),
            Text(title, style: const TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Colors.white, fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
