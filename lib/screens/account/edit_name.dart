import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/screens/account/account_profile_controller.dart';

class EditNameBottomSheetState extends GetWidget<AccountProfileController> {
  const EditNameBottomSheetState({super.key});

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
              const Text("Name",
                  style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Colors.white, fontSize: 24)),
              const SizedBox(height: 40),
              Form(
                key: controller.nameKey,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Name To Save Edit";
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  cursorColor: Colors.white,
                  controller: controller.nameController,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w600, color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      filled: true,
                      fillColor: const Color(0x30ffffff),
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(12))),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  controller.updateName();
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
