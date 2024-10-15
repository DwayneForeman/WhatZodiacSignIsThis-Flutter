import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/routes/app_pages.dart';
import 'package:whatsignisthis/services/app_service.dart';

import '../utils/snack_util.dart';

class HomeView extends GetView {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Onboarding1-Bg.png"), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 50),
              Image.asset("assets/images/WhatSignIsThis.png",
                  width: MediaQuery.of(context).size.width * 0.9, height: MediaQuery.of(context).size.width * 0.9),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (Get.find<AppService>().intro.value) {
                    Get.toNamed(Routes.INTRO);
                  } else {
                    Get.toNamed(Routes.LOGIN);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                      colors: [Color(0xff6814CE), Color(0xff296FF9)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              colors: [Color(0xffB721FF), Color(0xff21D4FD)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(bounds);
                          },
                          child: const Text(
                            "Let's Play",
                            style: TextStyle(fontFamily: "Cherry", fontSize: 28, color: Colors.white),
                          ),
                        ),
                        Text(
                          "Let's Play",
                          style: TextStyle(
                            fontFamily: "Cherry",
                            fontSize: 28,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 1.7
                              ..color = const Color(0xffF2F2F2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: "Mont",
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff),
                      fontSize: 11,
                    ),
                    children: [
                      const TextSpan(
                        text: 'By signing up you agree to our ',
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {SnackUtil.openUrl(uri: Uri.parse("https://www.whatsignisthis.app/terms"))},
                        text: 'Terms of Service.',
                        style: const TextStyle(decoration: TextDecoration.underline),
                      ),
                      const TextSpan(text: ' Learn how we protect your data in our '),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {SnackUtil.openUrl(uri: Uri.parse("https://www.whatsignisthis.app/privacy"))},
                        text: 'Privacy Policy.',
                        style: const TextStyle(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
