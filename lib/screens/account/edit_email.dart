import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:whatsignisthis/screens/account/account_profile_controller.dart';

class EditEmailBottomSheet extends GetWidget<AccountProfileController> {
  const EditEmailBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xff9B51E0), Color(0xff2575FC)]),
            borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Text("Email",
                  style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Colors.white, fontSize: 24)),
              const SizedBox(height: 40),
              Form(
                key: controller.emailKey,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email To Save Edit";
                    }else  if (!GetUtils.isEmail(value)) {
                      return "Enter Correct Email";
                    }
                    return null;
                  },
                  cursorColor: Colors.white,
                  controller: controller.emailController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w600, color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      filled: true,
                      fillColor: const Color(0x30ffffff),
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(12))),
                ),
              ),
              const SizedBox(height: 20),
              const Text("By clicking update, you agree to receive\ncommunication via email from What Sign Is This.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w400, color: Color(0xffffffff), fontSize: 12)),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  controller.updateEmail();
                },
                child: Container(
                  width: 118,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(colors: [Color(0xff434343), Color(0xff000000)])),
                  child: const Center(
                      child: Text("Update",
                          style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 16))),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
