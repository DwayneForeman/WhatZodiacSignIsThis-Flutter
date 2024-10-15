import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/routes/app_pages.dart';

import '/utils/snack_util.dart';

class AboutUsView extends GetView {
  const AboutUsView({super.key});

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
                    child: Icon(Icons.arrow_back, color: Colors.white, size: MediaQuery.of(context).size.width * 0.077),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.056),
                    child: Text("About Us",
                        style: TextStyle(
                            fontFamily: "SF-Compact",
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.088)),
                  ),
                  const SizedBox(height: 20),
                  AboutContainer(title: "Who Are We", onClick: () => Get.toNamed(Routes.WHO_ARE_WE)),
                  AboutContainer(title: "Contact Us", onClick: () => Get.toNamed(Routes.CONTACT_US)),
                  AboutContainer(
                    title: "Terms & Conditions",
                    onClick: () => SnackUtil.openUrl(uri: Uri.parse("https://www.whatsignisthis.app/terms")),
                  ),
                  AboutContainer(
                    title: "Privacy Policy",
                    onClick: () => SnackUtil.openUrl(uri: Uri.parse("https://www.whatsignisthis.app/privacy")),
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

class AboutContainer extends StatelessWidget {
  const AboutContainer({super.key, required this.title, this.onClick});

  final String title;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          height: 130,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0x75B721FF), Color(0x7521D4FD)]), borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/i-circle.png",
                  width: MediaQuery.of(context).size.width * 0.082,
                  height: MediaQuery.of(context).size.width * 0.082,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.041),
                Text(title,
                    style: TextStyle(
                        fontFamily: "SF-Compact",
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.06)),
                const Spacer(),
                Icon(Icons.arrow_forward, color: Colors.white, size: MediaQuery.of(context).size.width * 0.066)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
