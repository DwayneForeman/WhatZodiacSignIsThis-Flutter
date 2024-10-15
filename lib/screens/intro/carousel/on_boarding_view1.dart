import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingView1 extends GetView {
  const OnBoardingView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 27),
        const Spacer(),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.66,
          width: MediaQuery.of(context).size.width * 0.75,
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.width * 0.11,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  height: MediaQuery.of(context).size.width * 0.55,
                  decoration:
                      const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Container.png"), fit: BoxFit.fill)),
                  child: Center(
                      child: Text(
                          textAlign: TextAlign.center,
                          "At this big age, running an errand\nis now considered “going out” and\nyou can’t tell me any different.\nArgue with ya mamma!",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w800,
                              color: const Color(0xffffffff),
                              fontSize: MediaQuery.of(context).size.width * 0.0335))),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset("assets/images/Smiley.png",
                      width: MediaQuery.of(context).size.width * 0.218, height: MediaQuery.of(context).size.width * 0.218))
            ],
          ),
        ),
        const Spacer(),
        Text("1200+ Text Memes",
            style: TextStyle(fontFamily: "Cherry", color: const Color(0xffffffff), fontSize: MediaQuery.of(context).size.width * 0.075)),
        const SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width * 0.72,
          height: 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), gradient: const LinearGradient(colors: [Color(0xff12A5FF), Color(0xff12FFF7)])),
        ),
        SizedBox(height: MediaQuery.of(context).size.width * 0.053),
        Text("Laugh Your Ahhh Off",
            style: TextStyle(
                fontFamily: "SF-Compact",
                fontWeight: FontWeight.w900,
                color: const Color(0xffffffff),
                fontSize: MediaQuery.of(context).size.width * 0.0442)),
        SizedBox(height: MediaQuery.of(context).size.width * 0.083),
        Text(
            textAlign: TextAlign.center,
            "Enjoy the most funniest meme jokes to\nkeep you entertained all day ‘n’ night.",
            style: TextStyle(
                fontFamily: "SF-Compact",
                fontWeight: FontWeight.w500,
                color: const Color(0xffffffff),
                fontSize: MediaQuery.of(context).size.width * 0.0442)),
        SizedBox(height: MediaQuery.of(context).size.width * 0.11),
      ],
    );
  }
}
