import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhoAreWeView extends GetView {
  const WhoAreWeView({super.key});

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
                    child: Text("Who Are We",
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
                                  "Welcome",
                                  style: TextStyle(fontFamily: "Cherry", fontSize: 32, color: Colors.white),
                                ),
                              ),
                              Text(
                                "Welcome",
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
                              'Introducing "What Sign is This," a captivating meme-based trivia app designed to put your knowledge and skillset to the test! Dive into the intriguing world of astrology as you discover and identify the most intriguing and sometimes, "toxic" traits of all 12 zodiac signs. Are you ready to prove your astrological expertise? Join the fun and find out!',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 18)),
                          const SizedBox(height: 20),
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
