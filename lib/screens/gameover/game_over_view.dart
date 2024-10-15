import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/routes/app_pages.dart';
import 'package:whatsignisthis/screens/gameover/game_over_controller.dart';

class GameOverView extends GetView<GameOverController> {
  const GameOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/UpgradeScreen-Bg.png"), fit: BoxFit.fill)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/ic_game_over.png",
                          width: MediaQuery.of(context).size.width * 0.55, height: MediaQuery.of(context).size.width * 0.555),
                      const SizedBox(height: 15),
                      Container(
                        width: Get.mediaQuery.size.width * 0.9,
                        decoration: BoxDecoration(
                          color: const Color(0x1fffffff),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 48.0),
                              child: GestureDetector(
                                onTap: () => Get.offNamed(Routes.UPGRADE),
                                child: Column(
                                  children: [
                                    Text(
                                      "Go Premium",
                                      style: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontSize: MediaQuery.of(context).size.width * 0.08,
                                          fontFamily: "Cherry"),
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: const LinearGradient(
                                          colors: [Color(0xffB3FFAB), Color(0xff12FFF7)],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    const FeatureRow(label: "Unlimited Games", iconPath: "assets/images/ic_recycle.png"),
                                    const FeatureRow(label: "1200 + Text Memes", iconPath: "assets/images/smiley-icon.png"),
                                    const FeatureRow(label: "No More Ads", iconPath: "assets/images/no-more-ads.png"),
                                    const FeatureRow(label: "& much more...", iconPath: "assets/images/ic_tick.png"),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset("assets/images/solar_crown.png"),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                padding: const EdgeInsets.only(left: 8, top: 5, right: 8, bottom: 5),
                                margin: const EdgeInsets.only(left: 16, top: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: const LinearGradient(
                                    colors: [Color(0xffB3FFAB), Color(0xff12FFF7)],
                                  ),
                                ),
                                child: Text(
                                  "BEST VALUE",
                                  style: TextStyle(
                                      color: const Color(0xff000000),
                                      fontSize: MediaQuery.of(context).size.width * 0.028,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: GestureDetector(
                                  onTap: () => controller.buy100Points(),
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0x1fffffff),
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 8, top: 5, right: 8, bottom: 5),
                                        margin: const EdgeInsets.only(left: 16, top: 16),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          gradient: const LinearGradient(
                                            colors: [Color(0xffB3FFAB), Color(0xff12FFF7)],
                                          ),
                                        ),
                                        child: Text(
                                          "One-Time",
                                          style: TextStyle(
                                              color: const Color(0xff000000),
                                              fontSize: MediaQuery.of(context).size.width * 0.028,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        Image.asset("assets/images/ic_star.png", width: Get.mediaQuery.size.width * 0.16),
                                        Text(
                                          "100",
                                          style: TextStyle(
                                              fontFamily: "SF-Compact",
                                              fontSize: Get.mediaQuery.size.width * 0.045,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return const LinearGradient(
                                          colors: [Color(0xff43E97B), Color(0xff38F9D7)],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ).createShader(bounds);
                                      },
                                      child: Text(
                                        "+100 Points",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Cherry",
                                          fontSize: MediaQuery.of(context).size.width * 0.05,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "\$1.99",
                                      style: TextStyle(
                                        color: const Color(0xffffffff),
                                        fontSize: MediaQuery.of(context).size.width * 0.04,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "SF-Compact",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Flexible(
                            child: GestureDetector(
                              onTap: () => controller.loadRewardedAd(),
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0x1fffffff),
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 8, top: 5, right: 8, bottom: 5),
                                        margin: const EdgeInsets.only(left: 16, top: 16),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          gradient: const LinearGradient(
                                            colors: [Color(0xffB3FFAB), Color(0xff12FFF7)],
                                          ),
                                        ),
                                        child: Text(
                                          "Free",
                                          style: TextStyle(
                                              color: const Color(0xff000000),
                                              fontSize: MediaQuery.of(context).size.width * 0.028,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Image.asset("assets/images/television.png", width: Get.mediaQuery.size.width * 0.16),
                                    const SizedBox(height: 5),
                                    ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return const LinearGradient(
                                          colors: [Color(0xff43E97B), Color(0xff38F9D7)],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ).createShader(bounds);
                                      },
                                      child: Text(
                                        "+20 Points",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Cherry",
                                          fontSize: MediaQuery.of(context).size.width * 0.05,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Watch Ads",
                                      style: TextStyle(
                                        color: const Color(0xffffffff),
                                        fontSize: MediaQuery.of(context).size.width * 0.04,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "SF-Compact",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.07,
                      ),
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
        width: MediaQuery.of(context).size.width * 0.55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(iconPath, width: MediaQuery.of(context).size.width * 0.065, height: MediaQuery.of(context).size.width * 0.065),
            const SizedBox(width: 10),
            Text(label,
                style: TextStyle(
                    fontFamily: "SF-Compact",
                    fontWeight: FontWeight.w900,
                    color: const Color(0xffffffff),
                    fontSize: MediaQuery.of(context).size.width * 0.039))
          ],
        ),
      ),
    );
  }
}
