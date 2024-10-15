import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingView2 extends GetView {
  const OnBoardingView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Spacer(),
        const Spacer(),
        const SizedBox(height: 25),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.3,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Container.png"), fit: BoxFit.fill)),
          child: Center(
              child: Text(
                  textAlign: TextAlign.center,
                  "“Wrong Girl” really irritates\nme. An organized man like\nmyself would never mix up\nmy woman",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w800,
                      color: const Color(0xffffffff),
                      fontSize: MediaQuery.of(context).size.width * 0.0275))),
        ),
        const SizedBox(height: 5),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.211,
                  height: MediaQuery.of(context).size.width * 0.211,
                  decoration: BoxDecoration(color: const Color(0x10ffffff), borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/level2-pic1.png",
                          width: MediaQuery.of(context).size.width * 0.13, height: MediaQuery.of(context).size.width * 0.13),
                      const SizedBox(height: 2),
                      Text("Aquarius",
                          style: TextStyle(
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w900,
                              color: const Color(0xffffffff),
                              fontSize: MediaQuery.of(context).size.width * 0.029))
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.211,
                  height: MediaQuery.of(context).size.width * 0.211,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xffFFE29F), Color(0xffFFA99F), Color(0xffFF719A)]),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/level2-pic2.png",
                          width: MediaQuery.of(context).size.width * 0.13, height: MediaQuery.of(context).size.width * 0.13),
                      const SizedBox(height: 2),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [Color(0xff6A11CB), Color(0xff2575FC)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds);
                        },
                        child: Text("Virgo",
                            style: TextStyle(
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w900,
                                color: const Color(0xffffffff),
                                fontSize: MediaQuery.of(context).size.width * 0.029)),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        const SizedBox(height: 5),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.211,
                  height: MediaQuery.of(context).size.width * 0.211,
                  decoration: BoxDecoration(color: const Color(0x10ffffff), borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/level2-pic3.png",
                          width: MediaQuery.of(context).size.width * 0.13, height: MediaQuery.of(context).size.width * 0.13),
                      const SizedBox(height: 2),
                      Text("Capricorn",
                          style: TextStyle(
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w900,
                              color: const Color(0xffffffff),
                              fontSize: MediaQuery.of(context).size.width * 0.029))
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.211,
                  height: MediaQuery.of(context).size.width * 0.211,
                  decoration: BoxDecoration(color: const Color(0x10ffffff), borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/level2-pic4.png",
                          width: MediaQuery.of(context).size.width * 0.13, height: MediaQuery.of(context).size.width * 0.13),
                      const SizedBox(height: 2),
                      Text("Leo",
                          style: TextStyle(
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w900,
                              color: const Color(0xffffffff),
                              fontSize: MediaQuery.of(context).size.width * 0.029))
                    ],
                  ),
                ),
              ],
            )),
        const Spacer(),
        SizedBox(height: MediaQuery.of(context).size.width * 0.075),
        Text("Test your Zodiac IQ",
            style: TextStyle(fontFamily: "Cherry", color: const Color(0xffffffff), fontSize: MediaQuery.of(context).size.width * 0.07)),
        const SizedBox(height: 3),
        Container(
          width: MediaQuery.of(context).size.width * 0.72,
          height: 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), gradient: const LinearGradient(colors: [Color(0xff12A5FF), Color(0xff12FFF7)])),
        ),
        SizedBox(height: MediaQuery.of(context).size.width * 0.05),
        Text("Guess that Zodiac!",
            style: TextStyle(
                fontFamily: "SF-Compact",
                fontWeight: FontWeight.w900,
                color: const Color(0xffffffff),
                fontSize: MediaQuery.of(context).size.width * 0.04)),
        SizedBox(height: MediaQuery.of(context).size.width * 0.08),
        Text(
            textAlign: TextAlign.center,
            "Guess which Sign is most likely to say\nwhat is written in text meme displayed.",
            style: TextStyle(
                fontFamily: "SF-Compact",
                fontWeight: FontWeight.w500,
                color: const Color(0xffffffff),
                fontSize: MediaQuery.of(context).size.width * 0.04)),
        SizedBox(height: MediaQuery.of(context).size.width * 0.1),
      ],
    );
  }
}
