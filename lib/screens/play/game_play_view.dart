import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:whatsignisthis/screens/play/game_play_controller.dart';
import 'package:whatsignisthis/utils/utils.dart';

class GamePlayView extends GetView<GamePlayController> {
  const GamePlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.mediaQuery.size.width,
        height: Get.mediaQuery.size.height,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/levels-texture.png"), fit: BoxFit.fill)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Obx(
                () => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => {controller.onTapBalloon()},
                          child: Stack(
                            alignment: AlignmentDirectional.centerStart,
                            children: [
                              Image.asset(
                                "assets/images/ic_balloon.png",
                                width: Get.mediaQuery.size.width * 0.2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0, left: 10),
                                child: Transform.rotate(
                                  angle: -math.pi / 7,
                                  child: Text(
                                    "50/50",
                                    style: TextStyle(
                                      fontFamily: "SF-Compact",
                                      fontSize: Get.mediaQuery.size.width * 0.03,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.asset("assets/images/ic_star.png", width: Get.mediaQuery.size.width * 0.2),
                            Text(
                              "${controller.settings.totalPoints.value}",
                              style: TextStyle(
                                  fontFamily: "SF-Compact",
                                  fontSize: Get.mediaQuery.size.width * 0.045,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Image.asset("assets/images/ic_home.png", width: Get.mediaQuery.size.width * 0.17),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Image.asset("assets/images/Text.png", width: Get.mediaQuery.size.width),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: Get.mediaQuery.size.width,
                      height: Get.mediaQuery.size.width * 0.76,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: Get.mediaQuery.size.width * 0.885,
                              height: Get.mediaQuery.size.width * 0.72,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(color: Color(0x30000000), spreadRadius: 0.1, blurRadius: 5, offset: Offset(0, 5))
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const RadialGradient(colors: [Color(0x12DFE9F3), Color(0x55ffffff)], center: Alignment.center)),
                            ),
                          ),
                          Container(
                            width: Get.mediaQuery.size.width * 0.86,
                            height: Get.mediaQuery.size.width * 0.72,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(
                                    colors: [Color(0xffDFE9F3), Colors.white],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    stops: [0.55, 1])),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Center(
                                child: controller.questionLoading.value
                                    ? Utils.circularProgressIndicator()
                                    : controller.questionsList.isEmpty
                                        ? Text(controller.errorMessage)
                                        : Text(
                                            controller.questionsList[controller.questionIndex.value].question,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w900,
                                              color: const Color(0xff280A82),
                                              fontSize: Get.mediaQuery.size.width * 0.045,
                                            ),
                                          ),
                              ),
                            ),
                          ),
                          Positioned(
                              left: 0,
                              right: 15,
                              bottom: Get.mediaQuery.size.width * 0.0835,
                              child: Center(child: Text("🤣", style: TextStyle(fontSize: Get.mediaQuery.size.width * 0.0835))))
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    controller.answerLoading.value
                        ? Utils.circularProgressIndicator()
                        : controller.currentAnswersList.isNotEmpty
                            ? Wrap(
                                direction: Axis.vertical,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: controller.level == 1 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                                    children: [
                                      optionsContainer(0),
                                      SizedBox(width: controller.level < 3 ? 20 : 8),
                                      optionsContainer(1),
                                      if (controller.level > 1) SizedBox(width: controller.level < 3 ? 20 : 8),
                                      if (controller.level > 1) optionsContainer(2),
                                      if (controller.level > 2) SizedBox(width: controller.level < 3 ? 20 : 8),
                                      if (controller.level > 2) optionsContainer(3),
                                    ],
                                  ),
                                  SizedBox(height: controller.level < 3 ? 20 : 12),
                                  Row(
                                    mainAxisAlignment: controller.level == 1 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                                    children: [
                                      optionsContainer(controller.level == 1
                                          ? 2
                                          : controller.level == 2
                                              ? 3
                                              : 4),
                                      SizedBox(width: controller.level < 3 ? 20 : 8),
                                      optionsContainer(controller.level == 1
                                          ? 3
                                          : controller.level == 2
                                              ? 4
                                              : 5),
                                      if (controller.level == 3) const SizedBox(width: 8),
                                      if (controller.level == 3) optionsContainer(6),
                                      if (controller.level == 3) const SizedBox(width: 8),
                                      if (controller.level == 3) optionsContainer(7),
                                    ],
                                  ),
                                  if (controller.level > 1) SizedBox(height: controller.level == 2 ? 20 : 8),
                                  if (controller.level > 1)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        optionsContainer(controller.level == 2 ? 5 : 8),
                                        SizedBox(width: controller.level == 2 ? 20 : 8),
                                        optionsContainer(controller.level == 2 ? 6 : 9),
                                        SizedBox(width: controller.level == 2 ? 20 : 8),
                                        optionsContainer(controller.level == 2 ? 7 : 10),
                                        if (controller.level == 3) const SizedBox(width: 8),
                                        if (controller.level == 3) optionsContainer(11),
                                      ],
                                    ),
                                ],
                              )
                            : const Text(""),
                    const SizedBox(height: 10),
                    controller.bannerLoaded.value
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget optionsContainer(int index) {
    return GestureDetector(
      onTap: () => controller.showResponseDialog(index),
      child: controller.level == 1
          ? Container(
              width: Get.mediaQuery.size.width * 0.5 - 30,
              height: Get.mediaQuery.size.width * 0.32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0x30ffffff),
                gradient: null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      FadeInImage.assetNetwork(
                        placeholder: "assets/images/loading.gif",
                        image: controller.currentAnswersList[index].imageUrl,
                        width: Get.mediaQuery.size.width * 0.15,
                        height: Get.mediaQuery.size.width * 0.15,
                      ),
                      if (controller.currentAnswersList[index].isDisabled)
                        Image.asset(
                          "assets/images/ic_disabled.png",
                          width: Get.mediaQuery.size.width * 0.15,
                          height: Get.mediaQuery.size.width * 0.15,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: Get.mediaQuery.size.width * 0.0167,
                  ),
                  Text(
                    controller.currentAnswersList[index].answer,
                    style: TextStyle(
                      fontFamily: "SF-Compact",
                      fontWeight: FontWeight.w900,
                      color: const Color(0xffffffff),
                      fontSize: Get.mediaQuery.size.width * 0.056,
                    ),
                  ),
                ],
              ),
            )
          : controller.level == 2
              ? Container(
                  width: Get.mediaQuery.size.width * 0.26,
                  height: Get.mediaQuery.size.width * 0.26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0x10ffffff),
                    gradient: null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          FadeInImage.assetNetwork(
                            placeholder: "assets/images/loading.gif",
                            image: controller.currentAnswersList[index].imageUrl,
                            width: Get.mediaQuery.size.width * 0.12,
                            height: Get.mediaQuery.size.width * 0.12,
                          ),
                          if (controller.currentAnswersList[index].isDisabled)
                            Image.asset(
                              "assets/images/ic_disabled.png",
                              width: Get.mediaQuery.size.width * 0.12,
                              height: Get.mediaQuery.size.width * 0.12,
                            ),
                        ],
                      ),
                      SizedBox(height: Get.mediaQuery.size.width * 0.0167),
                      Text(
                        controller.currentAnswersList[index].answer,
                        style: TextStyle(
                            fontFamily: "SF-Compact",
                            fontWeight: FontWeight.w900,
                            color: const Color(0xffffffff),
                            fontSize: Get.mediaQuery.size.width * 0.034),
                      ),
                    ],
                  ),
                )
              : Container(
                  width: Get.mediaQuery.size.width * 0.25 - 16,
                  height: Get.mediaQuery.size.width * 0.25 - 16,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0x10ffffff), gradient: null),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          FadeInImage.assetNetwork(
                            placeholder: "assets/images/loading.gif",
                            image: controller.currentAnswersList[index].imageUrl,
                            width: Get.mediaQuery.size.width * 0.10,
                            height: Get.mediaQuery.size.width * 0.12,
                          ),
                          if (controller.currentAnswersList[index].isDisabled)
                            Image.asset(
                              "assets/images/ic_disabled.png",
                              width: Get.mediaQuery.size.width * 0.10,
                              height: Get.mediaQuery.size.width * 0.12,
                            ),
                        ],
                      ),
                      SizedBox(
                        height: Get.mediaQuery.size.width * 0.0167,
                      ),
                      Text(
                        controller.currentAnswersList[index].answer,
                        style: TextStyle(
                          fontFamily: "SF-Compact",
                          fontWeight: FontWeight.w900,
                          color: const Color(0xffffffff),
                          fontSize: Get.mediaQuery.size.width * 0.028,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
