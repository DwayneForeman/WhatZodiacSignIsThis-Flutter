import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/routes/app_pages.dart';
import 'package:whatsignisthis/services/app_service.dart';
import 'package:whatsignisthis/services/iap_service.dart';
import 'package:whatsignisthis/utils/table_collection.dart';
import 'package:whatsignisthis/utils/utils.dart';

class OTPController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  TextEditingController otpController = TextEditingController();
  final otpKey = GlobalKey<FormState>();

  String verificationId = "";
  int? resendToken;

  final countdownSeconds = 60.obs;
  Timer? _timer;
  final enableResend = false.obs;
  late String phone;

  @override
  void onInit() {
    phone = Get.arguments as String;
    super.onInit();
    startTimer();
    sendCode(false);
  }

  void startTimer() {
    if (_timer != null && _timer?.isActive == true) {
      _timer?.cancel();
    }
    _timer = null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdownSeconds.value > 0) {
        countdownSeconds.value--;
      } else {
        _timer?.cancel();
        enableResend.value = true;
      }
    });
  }

  void sendCode(bool resend) {
    if (phone.isNotEmpty) {
      enableResend.value = false;
      countdownSeconds.value = 60;
      startTimer();
      _auth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: const Duration(seconds: 60),
          forceResendingToken: resendToken,
          verificationCompleted: (PhoneAuthCredential credential) {
            next(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            if (e.code == 'invalid-phone-number') {
              ScaffoldMessenger.of(Get.context!).showSnackBar(invalidPhoneNumberSnackBar("Invalid phone number"));
            } else {
              ScaffoldMessenger.of(Get.context!).showSnackBar(invalidPhoneNumberSnackBar("Please try again later"));
            }
          },
          codeSent: (String verificationId, int? resendToken) {
            this.resendToken = resendToken;
            this.verificationId = verificationId;
            ScaffoldMessenger.of(Get.context!)
                .showSnackBar(codeSentSnackBar(resend ? "Verification code resent" : "Verification code sent"));
          },
          codeAutoRetrievalTimeout: (String verificationId) => {debugPrint("Auto time: $verificationId")});
    }
  }

  void next(PhoneAuthCredential credential) {
    Utils.showProgressDialog("Please wait...");
    var loggedIn = false;
    _auth.signInWithCredential(credential).then((value) {
      loggedIn = true;
      print("Error >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>value.user?.uid${value.user?.uid}");
      if (value.user != null) {
        CollectionReference userCollection = _db.collection(TableCollection.users);
        userCollection.doc(value.user?.uid).get().then((doc) async {
          if (doc.exists) {
            print("Error >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Exsist");
            await  Get.find<AppService>().getUserProfile();
            Get.find<IAPService>().initPlatformState();
            _navigate();

          } else {
            userCollection.count().get().then((count) {

              userCollection
                  .doc(value.user?.uid)
                  .set({"phone": phone, "uid": value.user?.uid, "serial_id": count.count! + 1}).then((value) {
                _db.collection(TableCollection.leaderBoard).doc(FirebaseAuth.instance.currentUser?.uid).set({
                  'uid': FirebaseAuth.instance.currentUser?.uid,
                  'points': FieldValue.increment(100),
                }, SetOptions(merge: true)).then((value) async {
                  print("Error >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${FirebaseAuth.instance.currentUser?.uid}");
                await  Get.find<AppService>().getUserProfile();
                  Get.find<IAPService>().initPlatformState();
                  _navigate();
                }).catchError((error) {
                  print("Error >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$error");
                  _navigate();
                });
              }).catchError((error) {
                if (Get.isDialogOpen == true) {
                  Get.back();
                }
              });
            });
          }
        });
      }
    }).catchError((error) {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      if (!loggedIn) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(incorrectCodeSnackBar());
      }
    });
  }

  void _navigate() {
    if (Get.isDialogOpen == true) {
        Get.back();
    }
    ScaffoldMessenger.of(Get.context!).showSnackBar(loginSuccessfulSnackBar());
    Get.offAllNamed(Routes.USER_HOME);
  }

  SnackBar codeSentSnackBar(String message) {
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
              gradient: const LinearGradient(
                  colors: [Color(0xff434343), Color(0xff000000)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              Image.asset("assets/images/mail-notification.png", width: 25, height: 25),
              const Spacer(),
              Text(message,
                  style: const TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w600, color: Color(0xffffffff), fontSize: 16)),
              const Spacer(),
              const SizedBox(width: 20)
            ],
          ),
        ));
  }

  SnackBar incorrectCodeSnackBar() {
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
              gradient: const LinearGradient(
                  colors: [Color(0xffF78CA0), Color(0xffF9748F), Color(0xffFD868C)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(width: 20),
              Icon(Icons.close, color: Colors.white, size: 20),
              Spacer(),
              Text("Incorrect verification code",
                  style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w600, color: Color(0xffffffff), fontSize: 16)),
              Spacer(),
              SizedBox(width: 20)
            ],
          ),
        ));
  }

  SnackBar invalidPhoneNumberSnackBar(String message) {
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
              gradient: const LinearGradient(
                  colors: [Color(0xffF78CA0), Color(0xffF9748F), Color(0xffFD868C)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              const Icon(Icons.close, color: Colors.white, size: 20),
              const Spacer(),
              Text(message,
                  style: const TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w600, color: Color(0xffffffff), fontSize: 16)),
              const Spacer(),
              const SizedBox(width: 20)
            ],
          ),
        ));
  }

  SnackBar loginSuccessfulSnackBar() {
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
              gradient: const LinearGradient(
                  colors: [Color(0xff43E97B), Color(0xff38F9D7)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(width: 20),
              Icon(Icons.check, color: Colors.white, size: 25),
              Spacer(),
              Text("Login Successful",
                  style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w600, color: Color(0xffffffff), fontSize: 16)),
              Spacer(),
              SizedBox(width: 20)
            ],
          ),
        ));
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
