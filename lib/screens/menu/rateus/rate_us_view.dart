import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/utils/snack_util.dart';

class RateUsView extends GetView {
  const RateUsView({super.key});

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
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.close, color: Colors.white, size: MediaQuery.of(context).size.width * 0.0835)),
                  ),
                  Image.asset("assets/images/Logo.png",
                      width: MediaQuery.of(context).size.width * 0.555, height: MediaQuery.of(context).size.width * 0.555),
                  const SizedBox(height: 30),
                  Text("We make you laugh?!",
                      style: TextStyle(fontFamily: "Cherry", color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.0835)),
                  const SizedBox(height: 8),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.805,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: const LinearGradient(colors: [Color(0xffB3FFAB), Color(0xff12FFF7)]))),
                  const SizedBox(height: 30),
                  Image.asset("assets/images/rate-us-laugh.png", width: MediaQuery.of(context).size.width * 0.835),
                  const SizedBox(height: 20),
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
                          "Rate us on the\nAppStore",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: "Cherry", fontSize: MediaQuery.of(context).size.width * 0.078, color: Colors.white),
                        ),
                      ),
                      Text(
                        "Rate us on the\nAppStore",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Cherry",
                          fontSize: MediaQuery.of(context).size.width * 0.078,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1.7
                            ..color = const Color(0xffF2F2F2),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () async {
                      SnackUtil.openUrl(uri: Uri.parse("market://details?id=com.appwiththat.whatsignisthis"));
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 272,
                      height: 72,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(colors: [Color(0xff434343), Color(0xff000000)])),
                      child: const Center(
                          child: Text("Rate Now",
                              style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Colors.white, fontSize: 20))),
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
