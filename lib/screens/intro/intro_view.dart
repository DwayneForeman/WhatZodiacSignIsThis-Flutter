import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:whatsignisthis/routes/app_pages.dart';
import 'package:whatsignisthis/screens/intro/intro_controller.dart';
import 'package:whatsignisthis/services/app_service.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          image: const DecorationImage(
            image: AssetImage("assets/images/Onboarding-Carousel-BG.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 85,
                child: PageView(
                  dragStartBehavior: DragStartBehavior.down,
                  controller: controller.carouselController,
                  onPageChanged: (index) => controller.currentIndex.value = index,
                  children: controller.pages,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (controller.currentIndex.value < 2) {
                    controller.carouselController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  } else {
                    Get.find<AppService>().intro.value = false;
                    Get.offNamed(Routes.LOGIN);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                      colors: [Color(0xff84FAB0), Color(0xff005BEA)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontFamily: "SF-Compact",
                          fontSize: MediaQuery.of(context).size.width * 0.055,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              SmoothPageIndicator(
                controller: controller.carouselController,
                count: 3,
                effect: const SwapEffect(
                  activeDotColor: Color(0xff84FAB0),
                  dotColor: Color(0xffC7C7CC),
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 8,
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
