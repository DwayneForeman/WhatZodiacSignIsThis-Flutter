import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/screens/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: Colors.white, size: 30)),
                    const SizedBox(height: 30),
                    const Text("My mobile",
                        style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Colors.white, fontSize: 28)),
                    const SizedBox(height: 20),
                    const Text("Please enter your valid phone number. We will send you a 6-digit code to verify your account.",
                        style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w400, color: Colors.white, fontSize: 14)),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 65,
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 52,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                          ),
                          Row(
                            children: [
                              IntrinsicWidth(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: SizedBox(
                                    height: 52,
                                    child: Center(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          IntrinsicWidth(
                                            child: SizedBox(
                                              height: 52,
                                              child: CountryCodePicker(
                                                flagWidth: 25,
                                                onChanged: (value) {
                                                  if (value.dialCode != null) {
                                                    controller.countryCode = value.dialCode;
                                                  } else {
                                                    controller.countryCode = "";
                                                  }
                                                },
                                                onInit: (value) {
                                                  if (value != null) {
                                                    if (value.dialCode != null) {
                                                      controller.countryCode = value.dialCode;
                                                    }
                                                  }
                                                },
                                                searchStyle: const TextStyle(
                                                    fontFamily: "SF-Compact",
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff000000),
                                                    fontSize: 17),
                                                padding: EdgeInsets.zero,
                                                textStyle: const TextStyle(
                                                    fontFamily: "SF-Compact",
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff000000),
                                                    fontSize: 17),
                                                dialogTextStyle: const TextStyle(
                                                    fontFamily: "SF-Compact",
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff000000),
                                                    fontSize: 17),
                                                initialSelection: 'US',
                                                showCountryOnly: false,
                                                showOnlyCountryWhenClosed: false,
                                                alignLeft: true,
                                              ),
                                            ),
                                          ),
                                          Image.asset(
                                            "assets/images/arrow-down-ios.png",
                                            width: 15,
                                            height: 15,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Form(
                                  key: controller.phoneNumberKey,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        controller.emptyFieldError.value = false;
                                      }
                                      if (value.length == 10) {
                                        controller.phone = value;
                                        controller.lessThan10Error.value = false;
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        controller.emptyFieldError.value = true;
                                      } else if (value.length < 10) {
                                        controller.lessThan10Error.value = true;
                                      }
                                      return null; // Return null if validation passes
                                    },
                                    controller: controller.phoneNumberController,
                                    cursorColor: const Color(0xff808080),
                                    maxLength: 10,
                                    cursorWidth: 1.5,
                                    keyboardType: TextInputType.phone,
                                    style: const TextStyle(
                                        fontFamily: "SF-Compact", fontWeight: FontWeight.w700, color: Colors.black, fontSize: 17),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(top: 5),
                                      counterStyle: TextStyle(
                                          fontWeight: FontWeight.w900, fontSize: 10, color: Colors.white, fontFamily: "SF-Compact"),
                                      hintText: "Enter Mobile Number",
                                      hintStyle: TextStyle(
                                          fontFamily: "SF-Compact", fontWeight: FontWeight.w400, color: Color(0xffAFADAD), fontSize: 16),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: controller.emptyFieldError.value
                          ? const Text("This field can't be empty",
                              style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w400, color: Colors.red, fontSize: 12))
                          : controller.lessThan10Error.value
                              ? const Text("This field must contain 10 numbers",
                                  style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w400, color: Colors.red, fontSize: 12))
                              : const SizedBox(),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () => controller.onClickNext(),
                      child: Center(
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
