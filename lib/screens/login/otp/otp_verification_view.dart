import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:whatsignisthis/screens/login/otp/otp_controller.dart';
import 'package:whatsignisthis/utils/utils.dart';

class OTPView extends GetView<OTPController> {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xff6A11CB), Color(0xff2575FC)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Align(alignment: Alignment.centerLeft, child: Icon(Icons.arrow_back, color: Colors.white, size: 30))),
                  const SizedBox(height: 40),
                  Obx(
                    () => Text(
                      formatTime(controller.countdownSeconds.value),
                      style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 30, fontFamily: "Sf-Compact"),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text("Enter the 6-digit code sent to you at",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 13, fontFamily: "SF-Compact")),
                  const SizedBox(height: 10),
                  Text(controller.phone,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14, fontFamily: "SF-Compact")),
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Form(
                        key: controller.otpKey,
                        child: Pinput(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          controller: controller.otpController,
                          validator: (value) =>
                              otpPinValidation(value, "This field cannot be empty.", "This field must have at least 6 characters."),
                          showCursor: false,
                          keyboardType: TextInputType.number,
                          mainAxisAlignment: MainAxisAlignment.start,
                          length: 6,
                          defaultPinTheme: Utils.defaultPinTheme,
                          focusedPinTheme: Utils.defaultPinTheme,
                          followingPinTheme: Utils.emptyPinTheme,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      if (controller.enableResend.value) controller.sendCode(true);
                    },
                    child: Obx(
                      () => Text("Send again",
                          style: TextStyle(
                              fontFamily: "SF-Compact",
                              fontWeight: FontWeight.w900,
                              color: controller.enableResend.value ? const Color(0xffffffff) : Colors.white70,
                              fontSize: 20)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      if (controller.otpKey.currentState!.validate()) {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(verificationId: controller.verificationId, smsCode: controller.otpController.text);
                        controller.next(credential);
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                          colors: [Color(0xff434343), Color(0xff000000)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Next",
                          style: TextStyle(fontFamily: "SF-Compact", fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
                        ),
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

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  String? otpPinValidation(String? value, String emptyMsg, String notCompletedMsg) {
    if (value!.isEmpty) {
      return emptyMsg;
    }
    if (value.toString().length != 6) {
      return notCompletedMsg;
    }

    return null;
  }
}
