import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:whatsignisthis/firebase_options.dart';
import 'package:whatsignisthis/routes/app_pages.dart';
import 'package:whatsignisthis/services/iap_service.dart';
import 'package:whatsignisthis/services/app_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  MobileAds.instance.updateRequestConfiguration(RequestConfiguration(testDeviceIds: ['FABDBA87B7DD66728C2B98418DDF6193']));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync<AppService>(() => AppService().init());
  await Get.putAsync<IAPService>(() => IAPService().init());
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'What Sign is This?',
      debugShowCheckedModeBanner: false,
      initialRoute: Get.find<AppService>().firebaseUser == null ? AppPages.initialRoute : Routes.USER_HOME,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertinoDialog,
      theme: ThemeData(primarySwatch: Colors.blue),
      themeMode: ThemeMode.light,
    );
  }
}
