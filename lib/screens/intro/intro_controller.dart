import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/screens/intro/carousel/on_boarding_view1.dart';
import 'package:whatsignisthis/screens/intro/carousel/on_boarding_view2.dart';
import 'package:whatsignisthis/screens/intro/carousel/on_boarding_view3.dart';

class IntroController extends GetxController {
  final carouselController = PageController();
  final currentIndex = 0.obs;

  final pages = [
    const OnBoardingView1(),
    const OnBoardingView2(),
    const OnBoardingView3(),
  ];
}
