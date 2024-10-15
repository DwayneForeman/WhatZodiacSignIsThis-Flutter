import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:whatsignisthis/services/app_service.dart';
import 'package:whatsignisthis/services/iap_service.dart';
import 'package:whatsignisthis/utils/ads_helper.dart';
import 'package:whatsignisthis/utils/constants.dart';
import 'package:whatsignisthis/utils/utils.dart';

class UserHomeController extends GetxController {
  AppService settings = Get.find<AppService>();
  IAPService iapService = Get.find<IAPService>();
  BannerAd? bannerAd;
  final bannerLoaded = false.obs;

  TextEditingController emailController = TextEditingController();

  @override
  void onInit() {
    emailController.text = settings.user.value.email;
    loadBanner();
    super.onInit();
  }
  final emailKey = GlobalKey<FormState>();
  void updateEmail() {
    if (emailKey.currentState!.validate()) {
      settings.user.value.email = emailController.text;
      settings.updateUserProfile();
    }
  }
  void loadBanner() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.fullBanner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
          bannerLoaded.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          bannerAd = null;
          bannerLoaded.value = false;
          ad.dispose();
        },
      ),
    ).load();
  }

  Future<void> restorePurchase() async {
    try {
      Utils.showProgressDialog("Restoring purchases...");
      CustomerInfo customerInfo = await Purchases.restorePurchases();
      iapService.isSubscriptionActive.value = customerInfo.entitlements.all[Constants.PREMIUM_SUBSCRIPTION]?.isActive == true;
      ScaffoldMessenger.of(Get.context!).showSnackBar(Utils.getSnackbar(success: true, message: "Purchases Restored!"));
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(Utils.getSnackbar(success: false, message: "No Purchases Restored!"));
    }
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  @override
  void onClose() {
    bannerAd?.dispose();
    emailController.dispose();
    super.onClose();
  }
}
