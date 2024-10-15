import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:whatsignisthis/models/purchase_model.dart';
import 'package:whatsignisthis/services/app_service.dart';
import 'package:whatsignisthis/utils/constants.dart';

class IAPService extends GetxService {
  AppService appService = Get.find<AppService>();
  late PurchaseModel? purchase;
  bool isConfiguredInApp = false;

  final isSubscriptionActive = false.obs;

  Future<IAPService> init() async {
    return this;
  }

  @override
  void onInit() {
    initPlatformState();
    //getPurchaseDetails();
    super.onInit();
  }

  Future<void> initPlatformState() async {
    if (appService.isLoggedIn) {
      await Purchases.setLogLevel(LogLevel.debug);
      PurchasesConfiguration configuration = PurchasesConfiguration(Constants.PUBLIC_GOOGLE_API_KEY)..appUserID = appService.firebaseUser?.uid;
      await Purchases.configure(configuration);
      isConfiguredInApp = true;
      checkPurchaseStatus();
    } else {
      isConfiguredInApp = false;
    }
  }

  Future<void> checkPurchaseStatus() async {
    if (!isConfiguredInApp) {
      return;
    }
    try {
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      isSubscriptionActive.value = customerInfo.entitlements.all[Constants.PREMIUM_SUBSCRIPTION]?.isActive == true;
      // access latest customerInfo
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }

  // void getPurchaseDetails() {
  //   if (appService.isLoggedIn) {
  //     // DateTime date = DateTime.now();
  //     // _db.collection(TableCollection.inAppurchases).doc(settingService.firebaseUser?.uid).set({
  //     //   "uid": settingService.firebaseUser?.uid,
  //     //   "product_id": Constants.WEEKLY_PRODUCT_ID,
  //     //   "subscription_date": date.add(const Duration(days: 7))
  //     // });
  //     _db.collection(TableCollection.inAppurchases).doc(appService.firebaseUser?.uid).get().then((snapShot) {
  //       if (snapShot.exists) {
  //         final data = snapShot.data();
  //         if (data != null) {
  //           purchase = PurchaseModel.fromJson(data);
  //           if (purchase != null) {
  //             DateTime? date = purchase?.subscriptionDate;
  //             if (date != null) {
  //               if (purchase?.productId == Constants.MONTHLY_PRODUCT_ID) {
  //                 date = date.add(const Duration(days: 7));
  //               } else if (purchase?.productId == Constants.WEEKLY_PRODUCT_ID) {
  //                 date = date.add(const Duration(days: 3));
  //               }

  //               if (date.compareTo(DateTime.now()) > 0) {
  //                 isPurchased.value = true;
  //               }
  //             }
  //           }
  //         }
  //       }
  //     });
  //   }
  // }
}
