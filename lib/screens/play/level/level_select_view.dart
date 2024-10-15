import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:whatsignisthis/routes/app_pages.dart';
import 'package:whatsignisthis/screens/play/level/level_select_controller.dart';

class LevelSelectView extends GetView<LevelSelectController> {
  const LevelSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.mediaQuery.size.width,
          // height: Get.mediaQuery.size.height,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/levels-texture.png"), fit: BoxFit.fill)),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                        onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back, color: Colors.white, size: Get.mediaQuery.size.width * 0.07)),
                  ),
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Levels",
                      style: TextStyle(
                          fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: const Color(0xffffffff), fontSize: Get.mediaQuery.size.width * 0.088),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Image.asset("assets/images/Emoji.png", width: Get.mediaQuery.size.width * 0.2, height: Get.mediaQuery.size.width * 0.2),
                  const SizedBox(height: 10),
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
                          "Let's Play",
                          style: TextStyle(fontFamily: "Cherry", fontSize: Get.mediaQuery.size.width * 0.089, color: Colors.white),
                        ),
                      ),
                      Text(
                        "Let's Play",
                        style: TextStyle(
                          fontFamily: "Cherry",
                          fontSize: Get.mediaQuery.size.width * 0.089,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = const Color(0xffF2F2F2),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => _navigateToGamePlay(level: 1),
                        child: Container(
                          width: Get.mediaQuery.size.width * 0.5 - 27.5,
                          height: Get.mediaQuery.size.width * 0.46,
                          decoration: BoxDecoration(
                            color: const Color(0x15ffffff),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset("assets/images/level1-pic1.png",
                                      width: Get.mediaQuery.size.width * 0.0925, height: Get.mediaQuery.size.width * 0.0925),
                                  Image.asset("assets/images/level1-pic2.png",
                                      width: Get.mediaQuery.size.width * 0.0925, height: Get.mediaQuery.size.width * 0.0925),
                                ],
                              ),
                              SizedBox(height: Get.mediaQuery.size.width * 0.0425),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset("assets/images/level1-pic3.png",
                                      width: Get.mediaQuery.size.width * 0.0925, height: Get.mediaQuery.size.width * 0.0925),
                                  Image.asset("assets/images/level1-pic4.png",
                                      width: Get.mediaQuery.size.width * 0.0925, height: Get.mediaQuery.size.width * 0.0925),
                                ],
                              ),
                              SizedBox(height: Get.mediaQuery.size.width * 0.0425),
                              Text("Level 1",
                                  style: TextStyle(
                                      fontFamily: "SF-Compact",
                                      fontWeight: FontWeight.w900,
                                      color: const Color(0xffffffff),
                                      fontSize: Get.mediaQuery.size.width * 0.056))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () => {_navigateToGamePlay(level: 2)},
                        child: Stack(
                          children: [
                            Container(
                              width: Get.mediaQuery.size.width * 0.5 - 27.5,
                              height: Get.mediaQuery.size.width * 0.46,
                              decoration: BoxDecoration(
                                color: const Color(0x15ffffff),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  const Spacer(),
                                  SizedBox(height: Get.mediaQuery.size.width * 0.0425),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset("assets/images/level2-pic1.png",
                                          width: Get.mediaQuery.size.width * 0.056, height: Get.mediaQuery.size.width * 0.056),
                                      Image.asset("assets/images/level2-pic2.png",
                                          width: Get.mediaQuery.size.width * 0.056, height: Get.mediaQuery.size.width * 0.056),
                                      Image.asset("assets/images/level2-pic3.png",
                                          width: Get.mediaQuery.size.width * 0.056, height: Get.mediaQuery.size.width * 0.056),
                                      Image.asset("assets/images/level2-pic4.png",
                                          width: Get.mediaQuery.size.width * 0.056, height: Get.mediaQuery.size.width * 0.056),
                                    ],
                                  ),
                                  SizedBox(height: Get.mediaQuery.size.width * 0.0425),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset("assets/images/level2-pic5.png",
                                          width: Get.mediaQuery.size.width * 0.056, height: Get.mediaQuery.size.width * 0.056),
                                      Image.asset("assets/images/level2-pic6.png",
                                          width: Get.mediaQuery.size.width * 0.056, height: Get.mediaQuery.size.width * 0.056),
                                      Image.asset("assets/images/level2-pic7.png",
                                          width: Get.mediaQuery.size.width * 0.056, height: Get.mediaQuery.size.width * 0.056),
                                      Image.asset("assets/images/level2-pic8.png",
                                          width: Get.mediaQuery.size.width * 0.056, height: Get.mediaQuery.size.width * 0.056),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text("Level 2",
                                      style: TextStyle(
                                          fontFamily: "SF-Compact",
                                          fontWeight: FontWeight.w900,
                                          color: const Color(0xffffffff),
                                          fontSize: Get.mediaQuery.size.width * 0.056)),
                                  SizedBox(height: Get.mediaQuery.size.width * 0.06),
                                ],
                              ),
                            ),
                            if (!controller.iapService.isSubscriptionActive.value)
                              Container(
                                width: Get.mediaQuery.size.width * 0.5 - 27.5,
                                height: Get.mediaQuery.size.width * 0.46,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("CHOOSE FROM 8\nZODIAC ANSWERS",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "SF-Compact",
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            fontSize: Get.mediaQuery.size.width * 0.042)),
                                    SizedBox(height: Get.mediaQuery.size.width * 0.032),
                                    Image.asset("assets/images/level-locked-icon.png",
                                        width: Get.mediaQuery.size.width * 0.098, height: Get.mediaQuery.size.width * 0.098)
                                  ],
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () => {_navigateToGamePlay(level: 3)},
                    child: Stack(
                      children: [
                        Container(
                          width: Get.mediaQuery.size.width,
                          height: Get.mediaQuery.size.width * 0.44,
                          decoration: BoxDecoration(
                            color: const Color(0x15ffffff),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset("assets/images/level2-pic4.png",
                                      width: Get.mediaQuery.size.width * 0.082, height: Get.mediaQuery.size.width * 0.082),
                                  Image.asset("assets/images/level2-pic3.png",
                                      width: Get.mediaQuery.size.width * 0.082, height: Get.mediaQuery.size.width * 0.082),
                                  Image.asset("assets/images/level2-pic2.png",
                                      width: Get.mediaQuery.size.width * 0.082, height: Get.mediaQuery.size.width * 0.082),
                                  Image.asset("assets/images/level2-pic1.png",
                                      width: Get.mediaQuery.size.width * 0.082, height: Get.mediaQuery.size.width * 0.082),
                                  Image.asset("assets/images/level1-pic2.png",
                                      width: Get.mediaQuery.size.width * 0.082, height: Get.mediaQuery.size.width * 0.082),
                                  Image.asset("assets/images/level1-pic1.png",
                                      width: Get.mediaQuery.size.width * 0.082, height: Get.mediaQuery.size.width * 0.082),
                                ],
                              ),
                              SizedBox(height: Get.mediaQuery.size.width * 0.056),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset("assets/images/level2-pic8.png",
                                      width: Get.mediaQuery.size.width * 0.082, height: Get.mediaQuery.size.width * 0.082),
                                  Image.asset("assets/images/level2-pic7.png",
                                      width: Get.mediaQuery.size.width * 0.082, height: Get.mediaQuery.size.width * 0.082),
                                  Image.asset("assets/images/level2-pic5.png",
                                      width: Get.mediaQuery.size.width * 0.082, height: Get.mediaQuery.size.width * 0.082),
                                  Image.asset("assets/images/level2-pic6.png",
                                      width: Get.mediaQuery.size.width * 0.082, height: Get.mediaQuery.size.width * 0.082),
                                  Image.asset("assets/images/level1-pic4.png",
                                      width: Get.mediaQuery.size.width * 0.082, height: Get.mediaQuery.size.width * 0.082),
                                  Image.asset("assets/images/level1-pic3.png",
                                      width: Get.mediaQuery.size.width * 0.082, height: Get.mediaQuery.size.width * 0.082),
                                ],
                              ),
                              SizedBox(height: Get.mediaQuery.size.width * 0.0425),
                              Text("Level 3",
                                  style: TextStyle(
                                      fontFamily: "SF-Compact",
                                      fontWeight: FontWeight.w900,
                                      color: const Color(0xffffffff),
                                      fontSize: Get.mediaQuery.size.width * 0.056)),
                            ],
                          ),
                        ),
                        if (!controller.iapService.isSubscriptionActive.value)
                          Container(
                            width: Get.mediaQuery.size.width,
                            height: Get.mediaQuery.size.width * 0.44,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("CHOOSE FROM 12 ZODIAC\nANSWERS",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "SF-Compact",
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: Get.mediaQuery.size.width * 0.042)),
                                SizedBox(height: Get.mediaQuery.size.width * 0.032),
                                Image.asset("assets/images/level-locked-icon.png",
                                    width: Get.mediaQuery.size.width * 0.098, height: Get.mediaQuery.size.width * 0.098)
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => controller.bannerLoaded.value
                        ? Container(
                            margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                            color: Colors.transparent,
                            width: controller.bannerAd!.size.width.toDouble(),
                            height: controller.bannerAd!.size.height.toDouble(),
                            child: AdWidget(ad: controller.bannerAd!),
                          )
                        : const SizedBox(
                            width: 1,
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

  void _navigateToGamePlay({required int level}) {
    if ((level == 2 || level == 3) && !controller.iapService.isSubscriptionActive.value) {
      Get.toNamed(Routes.UPGRADE);
    } else {
      Get.toNamed(Routes.GAME_PLAY, arguments: level);
    }
  }
}
