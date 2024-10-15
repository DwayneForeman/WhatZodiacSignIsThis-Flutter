import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class Utils {
  static final Shader linearGradient = const LinearGradient(
    stops: [0.6, 0.66, 0.8],
    colors: <Color>[Color(0xfff97695), Color(0xfffdd14c), Color(0xff36ffe6)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 100.0));

  static void showProgressDialog(String message) {
    Get.dialog(
      AlertDialog(
        content: Row(children: [
          const CircularProgressIndicator(
            backgroundColor: Colors.red,
          ),
          Container(margin: const EdgeInsets.only(left: 20), child: Text(message)),
        ]),
      ),
      barrierDismissible: false,
      transitionDuration: const Duration(microseconds: 400),
      transitionCurve: Curves.easeOut,
    );
  }

  static Widget circularProgressIndicator() {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        backgroundColor: Color(0xff3161F1),
      ),
    );
  }

  static final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(fontFamily: "SF-Compact", color: Colors.white, fontWeight: FontWeight.w900, fontSize: 30),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ));

  static final emptyPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(fontFamily: "SF-Compact", color: Colors.white, fontWeight: FontWeight.w900, fontSize: 30),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white));

  static SnackBar getSnackbar({required bool success, required String message}) {
    return SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: const Duration(seconds: 2),
      padding: EdgeInsets.zero,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      width: Get.mediaQuery.size.width * 0.8,
      content: Container(
        width: Get.mediaQuery.size.width * 0.8,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                colors: success ? const [Color(0xff43E97B), Color(0xff38F9D7)] : const [Color(0xffF78CA0), Color(0xffF9748F), Color(0xffFD868C)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            const Icon(Icons.check, color: Colors.white, size: 25),
            const Spacer(),
            Text(
              message,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xffffffff),
                fontSize: 16,
              ),
            ),
            const Spacer(),
            const SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
