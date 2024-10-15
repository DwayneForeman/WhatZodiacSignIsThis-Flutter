import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/screens/menu/contact/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:
              const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/UpgradeScreen-Bg.png"), fit: BoxFit.fill)),
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
                      child: Text("Contact Us",
                          style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 32)),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [Color(0x90B721FF), Color(0x9021D4FD)]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
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
                                      "Get in Touch",
                                      style: TextStyle(fontFamily: "Cherry", fontSize: 32, color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    "Get in Touch",
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
                            ),
                            const SizedBox(height: 15),
                            const Text('Name',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 24)),
                            const SizedBox(height: 10),
                            Form(
                                key: controller.formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "This field can't be empty";
                                        }
                                        return null;
                                      },
                                      cursorColor: Colors.white,
                                      style: const TextStyle(
                                          fontFamily: "SF-Compact", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 16),
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        fillColor: const Color(0x40ffffff),
                                        filled: true,
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    const Text('Email',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 24)),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "This field can't be empty";
                                        }
                                        return null;
                                      },
                                      cursorColor: Colors.white,
                                      style: const TextStyle(
                                          fontFamily: "SF-Compact", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 16),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                                          fillColor: const Color(0x40ffffff),
                                          filled: true),
                                    ),
                                    const SizedBox(height: 15),
                                    const Text('Message',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 24)),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "This field can't be empty";
                                        }
                                        return null;
                                      },
                                      maxLines: 6,
                                      cursorColor: Colors.white,
                                      style: const TextStyle(
                                          fontFamily: "SF-Compact", fontWeight: FontWeight.w500, color: Color(0xffffffff), fontSize: 16),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color(0x40ffffff),
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(6)),
                                      ),
                                    ),
                                  ],
                                )),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  controller.formKey.currentState!.validate();

                                  // Add logic here to submit contact form
                                },
                                child: Container(
                                  width: 118,
                                  height: 52,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: const LinearGradient(colors: [Color(0xff434343), Color(0xff000000)])),
                                  child: const Center(
                                      child: Text("Send",
                                          style: TextStyle(
                                              fontFamily: "SF-Compact",
                                              fontWeight: FontWeight.w900,
                                              color: Color(0xffffffff),
                                              fontSize: 16))),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
