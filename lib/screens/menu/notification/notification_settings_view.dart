import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/screens/menu/notification/notification_settings_controller.dart';

class NotificationSettingView extends GetView<NotificationSettingController> {
  const NotificationSettingView({super.key});

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
                  const Text("Notifications",
                      style: TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffffffff), fontSize: 32)),
                  const SizedBox(height: 25),
                  Obx(
                    () => Container(
                      width: MediaQuery.of(context).size.width,
                      height: 225,
                      decoration: BoxDecoration(color: const Color(0x15ffffff), borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomRadioTile(
                              title: 'Allow Notifications',
                              value: controller.selectedValue.value == "Allow",
                              onChanged: (value) {
                                controller.selectedValue.value = "Allow";
                                controller.settings.notify.value = true;
                              },
                            ),
                            CustomRadioTile(
                              title: 'Disable Notifications',
                              value: controller.selectedValue.value == 'Disable',
                              onChanged: (value) {
                                controller.selectedValue.value = "Disable";
                                controller.settings.notify.value = false;
                              },
                            ),
                          ],
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
}

class CustomRadioTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?) onChanged;

  const CustomRadioTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(
        title,
        style: const TextStyle(fontFamily: "SF-Compact", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
      ),
      value: value,
      groupValue: true,
      onChanged: onChanged,
      activeColor: Colors.white,
      selectedTileColor: Colors.white,
      controlAffinity: ListTileControlAffinity.trailing,
      tileColor: Colors.black,
      contentPadding: const EdgeInsets.only(bottom: 0),
      shape: const Border(bottom: BorderSide(color: Colors.white)),
    );
  }
}
