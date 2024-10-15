import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whatsignisthis/screens/leaderboard/leader_board_controller.dart';

class LeaderBoardView extends GetView<LeaderBoardController> {
  const LeaderBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.mediaQuery.size.width,
          height: 1290,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/Leaderboard-Bg.png"), fit: BoxFit.fill),
          ),
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                                style: TextStyle(
                                    fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 24),
                                children: [
                                  TextSpan(text: "Leaderboard\n"),
                                  TextSpan(
                                      text: "Top 10", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10, fontFamily: "Poppins"))
                                ])),
                      ),
                      const SizedBox(width: 20)
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: Get.mediaQuery.size.width,
                    height: 1132,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 8,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: SizedBox(
                              width: double.maxFinite,
                              height: Get.mediaQuery.size.height,
                              child: controller.boardList.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // 2nd
                                        controller.boardList.length > 1
                                            ? SizedBox(
                                                width: 90,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 30),
                                                  child: Column(children: [
                                                    SizedBox(
                                                      width: double.maxFinite,
                                                      height: 56,
                                                      child: controller.boardList[1].userModel.imageUrl.contains("http")
                                                          ? CircleAvatar(
                                                              backgroundImage: NetworkImage(controller.boardList[1].userModel.imageUrl),
                                                              radius: 28.0,
                                                            )
                                                          : controller.boardList[1].userModel.imageUrl.contains("assets")
                                                              ? CircleAvatar(
                                                                  backgroundImage: AssetImage(controller.boardList[1].userModel.imageUrl),
                                                                  radius: 28.0,
                                                                )
                                                              : const CircleAvatar(
                                                                  backgroundColor: Colors.transparent,
                                                                  backgroundImage: AssetImage("assets/images/default_dp.png"),
                                                                  radius: 28.0,
                                                                ),
                                                    ),
                                                    const SizedBox(height: 16),
                                                    Text(
                                                        controller.boardList[1].userModel.name.isEmpty
                                                            ? "User ${controller.boardList[1].userModel.serialId}"
                                                            : controller.boardList[1].userModel.name,
                                                        style: const TextStyle(
                                                            fontFamily: "SF-Compact",
                                                            fontWeight: FontWeight.w900,
                                                            color: Color(0xffffffff),
                                                            fontSize: 16)),
                                                    const SizedBox(height: 5),
                                                    Container(
                                                      padding: const EdgeInsets.only(left: 10.0, top: 6.0, right: 10.0, bottom: 6.0),
                                                      decoration: const BoxDecoration(
                                                        color: Color(0xFF9087E5),
                                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                                      ),
                                                      child: Text("${NumberFormat("#,##0").format(controller.boardList[1].points)} P",
                                                          style: const TextStyle(
                                                              fontFamily: "SF-Compact",
                                                              fontWeight: FontWeight.w900,
                                                              color: Color(0xffffffff),
                                                              fontSize: 12)),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Stack(alignment: Alignment.topCenter, children: [
                                                      Image.asset(width: 90, "assets/images/chart_bar2.png"),
                                                      const Padding(
                                                        padding: EdgeInsets.only(top: 20.0),
                                                        child: Text(
                                                          "2",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily: 'quizfontm',
                                                            fontSize: 50.0,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ])
                                                  ]),
                                                ),
                                              )
                                            : const SizedBox(
                                                width: 90,
                                              ),

                                        // 1st
                                        controller.boardList.isNotEmpty
                                            ? SizedBox(
                                                width: 90,
                                                child: Column(children: [
                                                  SizedBox(
                                                    width: double.maxFinite,
                                                    height: 56,
                                                    child: controller.boardList[0].userModel.imageUrl.contains("http")
                                                        ? CircleAvatar(
                                                            backgroundImage: NetworkImage(controller.boardList[0].userModel.imageUrl),
                                                            radius: 28.0,
                                                          )
                                                        : controller.boardList[0].userModel.imageUrl.contains("assets")
                                                            ? CircleAvatar(
                                                                backgroundImage: AssetImage(controller.boardList[0].userModel.imageUrl),
                                                                radius: 28.0,
                                                              )
                                                            : const CircleAvatar(
                                                                backgroundColor: Colors.transparent,
                                                                backgroundImage: AssetImage("assets/images/default_dp.png"),
                                                                radius: 28.0,
                                                              ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Text(
                                                      controller.boardList[0].userModel.name.isEmpty
                                                          ? "User ${controller.boardList[0].userModel.serialId}"
                                                          : controller.boardList[0].userModel.name,
                                                      style: const TextStyle(
                                                          fontFamily: "SF-Compact",
                                                          fontWeight: FontWeight.w900,
                                                          color: Color(0xffffffff),
                                                          fontSize: 16)),
                                                  const SizedBox(height: 5),
                                                  Container(
                                                    padding: const EdgeInsets.only(left: 10.0, top: 6.0, right: 10.0, bottom: 6.0),
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFF9087E5),
                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                    ),
                                                    child: Text("${NumberFormat("#,##0").format(controller.boardList[0].points)} P",
                                                        style: const TextStyle(
                                                            fontFamily: "SF-Compact",
                                                            fontWeight: FontWeight.w900,
                                                            color: Color(0xffffffff),
                                                            fontSize: 12)),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Stack(alignment: Alignment.topCenter, children: [
                                                    Image.asset(width: 90, "assets/images/chart_bar1.png"),
                                                    const Padding(
                                                      padding: EdgeInsets.only(top: 10.0),
                                                      child: Text(
                                                        "1",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'quizfontm',
                                                          fontSize: 70.0,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ])
                                                ]),
                                              )
                                            : const SizedBox(
                                                width: 90,
                                              ),

                                        // 3rd
                                        controller.boardList.length > 2
                                            ? SizedBox(
                                                width: 90,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 56),
                                                  child: Column(children: [
                                                    SizedBox(
                                                      width: double.maxFinite,
                                                      height: 56,
                                                      child: controller.boardList[2].userModel.imageUrl.contains("http")
                                                          ? CircleAvatar(
                                                              backgroundImage: NetworkImage(controller.boardList[2].userModel.imageUrl),
                                                              radius: 28.0,
                                                            )
                                                          : controller.boardList[0].userModel.imageUrl.contains("assets")
                                                              ? CircleAvatar(
                                                                  backgroundImage: AssetImage(controller.boardList[2].userModel.imageUrl),
                                                                  radius: 28.0,
                                                                )
                                                              : const CircleAvatar(
                                                                  backgroundColor: Colors.transparent,
                                                                  backgroundImage: AssetImage("assets/images/default_dp.png"),
                                                                  radius: 28.0,
                                                                ),
                                                    ),
                                                    const SizedBox(height: 16),
                                                    Text(
                                                        controller.boardList[2].userModel.name.isEmpty
                                                            ? "User ${controller.boardList[2].userModel.serialId}"
                                                            : controller.boardList[2].userModel.name,
                                                        style: const TextStyle(
                                                            fontFamily: "SF-Compact",
                                                            fontWeight: FontWeight.w900,
                                                            color: Color(0xffffffff),
                                                            fontSize: 16)),
                                                    const SizedBox(height: 5),
                                                    Container(
                                                      padding: const EdgeInsets.only(left: 10.0, top: 6.0, right: 10.0, bottom: 6.0),
                                                      decoration: const BoxDecoration(
                                                        color: Color(0xFF9087E5),
                                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                                      ),
                                                      child: Text("${NumberFormat("#,##0").format(controller.boardList[2].points)} P",
                                                          style: const TextStyle(
                                                              fontFamily: "SF-Compact",
                                                              fontWeight: FontWeight.w900,
                                                              color: Color(0xffffffff),
                                                              fontSize: 12)),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Stack(alignment: Alignment.topCenter, children: [
                                                      Image.asset(width: 90, "assets/images/chart_bar3.png"),
                                                      const Padding(
                                                        padding: EdgeInsets.only(top: 20.0),
                                                        child: Text(
                                                          "3",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily: 'quizfontm',
                                                            fontSize: 50.0,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ])
                                                  ]),
                                                ),
                                              )
                                            : const SizedBox(
                                                width: 90,
                                              ),
                                      ],
                                    )
                                  : const Text(""),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                                constraints: const BoxConstraints(maxWidth: 400),
                                width: Get.mediaQuery.size.width - 20,
                                height: 830,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(image: AssetImage("assets/images/User-Rank.png"), fit: BoxFit.fill)),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.boardList.length > 3 ? controller.boardList.length - 3 : 0,
                                    itemBuilder: (BuildContext context, int index) {
                                      var model = controller.boardList[index + 3];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                        child: Container(
                                          height: 92,
                                          width: Get.mediaQuery.size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 20),
                                              Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle, border: Border.all(color: const Color(0xffE6E6E6), width: 1.5)),
                                                child: Center(
                                                    child: Text("${index + 4}",
                                                        style: const TextStyle(
                                                            fontFamily: "Poppins",
                                                            fontWeight: FontWeight.w500,
                                                            color: Color(0xff858494),
                                                            fontSize: 12))),
                                              ),
                                              const SizedBox(width: 20),
                                              model.userModel.imageUrl.contains("http")
                                                  ? CircleAvatar(
                                                      backgroundImage: NetworkImage(model.userModel.imageUrl),
                                                      radius: 28.0,
                                                    )
                                                  : model.userModel.imageUrl.contains("assets")
                                                      ? CircleAvatar(
                                                          backgroundImage: AssetImage(model.userModel.imageUrl),
                                                          radius: 28.0,
                                                        )
                                                      : const CircleAvatar(
                                                          backgroundColor: Colors.transparent,
                                                          backgroundImage: AssetImage("assets/images/default_dp.png"),
                                                          radius: 28.0,
                                                        ),
                                              const SizedBox(width: 20),
                                              RichText(
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                      fontFamily: "SF-Compact",
                                                      fontWeight: FontWeight.w900,
                                                      color: Color(0xff0C092A),
                                                      fontSize: 16),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            "${model.userModel.name.isEmpty ? "User ${index + 4}" : model.userModel.name}\n"),
                                                    TextSpan(
                                                        text: model.points > 1 ? "${model.points} points" : "${model.points} point",
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Color(0xff858494),
                                                            fontWeight: FontWeight.w500,
                                                            height: 1.8))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )),
                          ),
                        ),
                      ],
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
