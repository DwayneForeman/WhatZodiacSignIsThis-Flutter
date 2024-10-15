import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HowToPlayView extends GetView {
  const HowToPlayView({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  ),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("How to Play",
                        style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 32)),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: const Color(0x15ffffff), borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                child: const Text(
                                  "Missions",
                                  style: TextStyle(fontFamily: "Cherry", fontSize: 32, color: Colors.white),
                                ),
                              ),
                              Text(
                                "Missions",
                                style: TextStyle(
                                  fontFamily: "Cherry",
                                  fontSize: 32,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 1.7
                                    ..color = const Color(0xffF2F2F2),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                              "Get ready for a delightful challenge! You'll encounter a randomly generated text meme along with a set of 4 (Level 1), 8 (Level 2), or 12 (Level 3) zodiac signs, each with its unique traits",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 18)),
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
                                child: const Text(
                                  "Objective",
                                  style: TextStyle(fontFamily: "Cherry", fontSize: 32, color: Colors.white),
                                ),
                              ),
                              Text(
                                "Objective",
                                style: TextStyle(
                                  fontFamily: "Cherry",
                                  fontSize: 32,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 1.7
                                    ..color = const Color(0xffF2F2F2),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                              "Among the Zodiac signs lies the one that perfectly matches the text meme's essence. Can you find the perfect cosmic match?",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 18)),
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
                                child: const Text(
                                  "Goal",
                                  style: TextStyle(fontFamily: "Cherry", fontSize: 32, color: Colors.white),
                                ),
                              ),
                              Text(
                                "Goal",
                                style: TextStyle(
                                  fontFamily: "Cherry",
                                  fontSize: 32,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 1.7
                                    ..color = const Color(0xffF2F2F2),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                              "Unleash your wit and intuition to choose the Zodiac sign whose flaws, annoying traits, and actions perfectly align with the text meme's humor. Let the fun and astrological exploration begin!",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 18)),
                        ],
                      ),
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
