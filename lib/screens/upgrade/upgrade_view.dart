import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/screens/upgrade/upgrade_controller.dart';

import '../../utils/snack_util.dart';

class UpgradeView extends GetView<UpgradeController> {
  const UpgradeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.mediaQuery.size.width,
        height: Get.mediaQuery.size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/UpgradeScreen-Bg.png"),
                fit: BoxFit.fill)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: Get.mediaQuery.size.width * 0.07,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/Logo.png",
                    width: Get.mediaQuery.size.width * 0.555,
                    height: Get.mediaQuery.size.width * 0.555,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Go Premium",
                    style: TextStyle(
                      color: const Color(0xffffffff),
                      fontSize: Get.mediaQuery.size.width * 0.088,
                      fontFamily: "Cherry",
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: Get.mediaQuery.size.width * 0.7,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        colors: [Color(0xffB3FFAB), Color(0xff12FFF7)],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const FeatureRow(
                      label: "3 Day Free Trial",
                      iconPath: "assets/images/free-trial-icon.png"),
                  const FeatureRow(
                      label: "No More Ads",
                      iconPath: "assets/images/no-more-ads.png"),
                  const FeatureRow(
                      label: "Unlock All Levels",
                      iconPath: "assets/images/lock-icon.png"),
                  const FeatureRow(
                      label: "1200 + Text Memes",
                      iconPath: "assets/images/smiley-icon.png"),
                  const FeatureRow(
                      label: "Free Content Updates",
                      iconPath: "assets/images/gift-icon.png"),
                  const FeatureRow(
                      label: "Cancel Anytime",
                      iconPath: "assets/images/close-icon.png"),
                  const SizedBox(height: 40),
                  Obx(
                    () => Wrap(
                      direction: Axis.vertical,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.character.value = SingingCharacter.on;
                            controller.onSelectedProduct(0);
                          },
                          child: Container(
                            height: Get.mediaQuery.size.width * 0.25,
                            width: Get.mediaQuery.size.width * 0.75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [Color(0xffB3FFAB), Color(0xff12FFF7)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: Get.mediaQuery.size.width * 0.05,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                            fontFamily: "SF-Compact",
                                            fontWeight: FontWeight.w900,
                                            color: const Color(0xff000000),
                                            fontSize:
                                                Get.mediaQuery.size.width *
                                                    0.045),
                                        children: [
                                          const TextSpan(
                                              text: "Start Free Trial\n"),
                                          TextSpan(
                                            text: controller.products.isNotEmpty
                                                ? "${controller.products[0].storeProduct.priceString} Per Week"
                                                : "\$2.99 Per Week",
                                            style: TextStyle(
                                              fontSize:
                                                  Get.mediaQuery.size.width *
                                                      0.035,
                                              fontWeight: FontWeight.w700,
                                              height: 1.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: Get.mediaQuery.size.width * 0.2,
                                    height: Get.mediaQuery.size.width * 0.094,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xffFF5858),
                                          Color(0xffF09819),
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "3 Days FREE",
                                        style: TextStyle(
                                          fontFamily: "SF-Compact",
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff000000),
                                          fontSize:
                                              Get.mediaQuery.size.width * 0.025,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        GestureDetector(
                          onTap: () {
                            controller.character.value = SingingCharacter.off;
                            controller.onSelectedProduct(1);
                          },
                          child: Container(
                            height: Get.mediaQuery.size.width * 0.25,
                            width: Get.mediaQuery.size.width * 0.75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                color: const Color(0x10ffffff)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: Get.mediaQuery.size.width * 0.05),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                            fontFamily: "SF-Compact",
                                            fontWeight: FontWeight.w900,
                                            color: const Color(0xffffffff),
                                            fontSize:
                                                Get.mediaQuery.size.width *
                                                    0.045),
                                        children: [
                                          const TextSpan(text: "Monthly\n"),
                                          TextSpan(
                                              text: controller.products.length >
                                                      1
                                                  ? "${controller.products[1].storeProduct.priceString} Per Month"
                                                  : "\$9.99 Per Month",
                                              style: TextStyle(
                                                  fontSize: Get.mediaQuery.size
                                                          .width *
                                                      0.035,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.5))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: Get.mediaQuery.size.width * 0.2,
                                    height: Get.mediaQuery.size.width * 0.094,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.black),
                                    child: Center(
                                        child: Text("Save 44%",
                                            style: TextStyle(
                                                fontFamily: "SF-Compact",
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xffffffff),
                                                fontSize:
                                                    Get.mediaQuery.size.width *
                                                        0.025))),
                                  ),
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
                    onTap: () => {controller.restorePurchase()},
                    child: Text(
                      "Restore Purchases",
                      style: TextStyle(
                        fontFamily: "SF-Compact",
                        fontWeight: FontWeight.w900,
                        color: const Color(0xffffffff),
                        fontSize: Get.mediaQuery.size.width * 0.0335,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => {
                            SnackUtil.openUrl(
                                uri: Uri.parse(
                                    "https://www.whatsignisthis.app/terms"))
                          },
                          child: Text("Terms of Service",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffffffff),
                                  fontSize: Get.mediaQuery.size.width * 0.0278,
                                  decoration: TextDecoration.underline)),
                        ),
                        GestureDetector(
                          onTap: () => {
                            SnackUtil.openUrl(
                                uri: Uri.parse(
                                    "https://www.whatsignisthis.app/privacy"))
                          },
                          child: Text("Privacy Policy",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffffffff),
                                  fontSize: Get.mediaQuery.size.width * 0.0278,
                                  decoration: TextDecoration.underline)),
                        ),
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
}

class FeatureRow extends StatelessWidget {
  const FeatureRow({super.key, required this.label, required this.iconPath});

  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 20),
      child: SizedBox(
        width: Get.mediaQuery.size.width * 0.55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(iconPath,
                width: Get.mediaQuery.size.width * 0.065,
                height: Get.mediaQuery.size.width * 0.065),
            const SizedBox(width: 10),
            Text(label,
                style: TextStyle(
                    fontFamily: "SF-Compact",
                    fontWeight: FontWeight.w900,
                    color: const Color(0xffffffff),
                    fontSize: Get.mediaQuery.size.width * 0.039))
          ],
        ),
      ),
    );
  }
}
