import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingView3 extends GetView {
  const OnBoardingView3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const SizedBox(height: 30),
        Image.asset("assets/images/Onboarding4-img.png", width: MediaQuery.of(context).size.width * 0.595),
        SizedBox(height: MediaQuery.of(context).size.width * 0.17),
        Text("Climb the Charts",
            style: TextStyle(fontFamily: "Cherry", color: const Color(0xffffffff), fontSize: MediaQuery.of(context).size.width * 0.075)),
        const SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width * 0.72,
          height: 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), gradient: const LinearGradient(colors: [Color(0xff12A5FF), Color(0xff12FFF7)])),
        ),
        const SizedBox(height: 20),
        Text("Feeling competitive?",
            style: TextStyle(
                fontFamily: "SF-Compact",
                fontWeight: FontWeight.w900,
                color: const Color(0xffffffff),
                fontSize: MediaQuery.of(context).size.width * 0.0442)),
        const SizedBox(height: 30),
        Text(
            textAlign: TextAlign.center,
            "Compete with others to reach the top 10\non the global leaderboard.",
            style: TextStyle(
                fontFamily: "SF-Compact",
                fontWeight: FontWeight.w500,
                color: const Color(0xffffffff),
                fontSize: MediaQuery.of(context).size.width * 0.0442)),
        const SizedBox(height: 40),
      ],
    );
  }
}
