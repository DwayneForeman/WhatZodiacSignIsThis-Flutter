import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:whatsignisthis/routes/app_pages.dart';
import 'package:whatsignisthis/services/iap_service.dart';
import 'package:whatsignisthis/utils/constants.dart';
import 'package:whatsignisthis/utils/utils.dart';

enum SingingCharacter { on, off }

class UpgradeController extends GetxController {
  IAPService iapService = Get.find<IAPService>();

  final character = SingingCharacter.on.obs;

  final products = <Package>[].obs;
  Package? _package;

  @override
  void onInit() {
    _getProducts();
    super.onInit();
  }

  Future<void> _getProducts() async {
    if (!iapService.isConfiguredInApp) {
      return;
    }
    try {
      Offerings offerings = await Purchases.getOfferings();
      Offering? current = offerings.current;
      if (current != null && current.availablePackages.isNotEmpty) {
        products.value = current.availablePackages;
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${products.value}");
      }
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }

  void onSelectedProduct(int packageIndex) {
    _package = products[packageIndex];
    purchagePackage();
  }

  Future<void> purchagePackage() async {
    try {
      if (_package != null) {
        final customerInfo = await Purchases.purchasePackage(_package!);
        final isPro = customerInfo.entitlements.active
            .containsKey(Constants.PREMIUM_SUBSCRIPTION);
        if (isPro) {
          ScaffoldMessenger.of(Get.context!).showSnackBar(Utils.getSnackbar(
              success: true, message: "Purchased Succcessful"));
          Get.offAllNamed(Routes.ROOT);
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
              Utils.getSnackbar(success: false, message: "Select product"));
        }
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            Utils.getSnackbar(success: false, message: "Select product"));
      }
    } on PlatformException catch (e) {
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      String error = "";
      if (errorCode == PurchasesErrorCode.purchaseCancelledError) {
        error = 'User cancelled';
      } else if (errorCode == PurchasesErrorCode.purchaseNotAllowedError) {
        error = 'User is not allowed to purchase';
      } else if (errorCode == PurchasesErrorCode.paymentPendingError) {
        error = 'Payment is pending';
      }
      print(">>>>>>>>>>>>>sdsdsd>>>>>>>>>>>>>>>>>>$error<<<<<<<<<<<<<<<<");
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(Utils.getSnackbar(success: false, message: error));
    }
  }

  Future<void> restorePurchase() async {
    try {
      Utils.showProgressDialog("Restoring purchases...");
      CustomerInfo customerInfo = await Purchases.restorePurchases();
      iapService.isSubscriptionActive.value = customerInfo
              .entitlements.all[Constants.PREMIUM_SUBSCRIPTION]?.isActive ==
          true;
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          Utils.getSnackbar(success: true, message: "Purchases Restored!"));
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          Utils.getSnackbar(success: false, message: "No Purchases Restored!"));
    }
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}
