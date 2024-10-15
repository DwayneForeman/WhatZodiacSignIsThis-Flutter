import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:whatsignisthis/services/app_service.dart';
import 'package:whatsignisthis/services/iap_service.dart';
import 'package:whatsignisthis/utils/ads_helper.dart';
import 'package:whatsignisthis/utils/utils.dart';

class GameOverController extends GetxController {
  AppService appService = Get.find<AppService>();
  IAPService iapService = Get.find<IAPService>();

  RewardedAd? _rewardedAd;

  void loadRewardedAd() {
    Utils.showProgressDialog("Loading Ad");
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (ad) {},
              // Called when an impression occurs on the ad.
              onAdImpression: (ad) {},
              // Called when the ad failed to show full screen content.
              onAdFailedToShowFullScreenContent: (ad, err) {
                // Dispose the ad here to free resources.
                ad.dispose();
              },
              // Called when the ad dismissed full screen content.
              onAdDismissedFullScreenContent: (ad) {
                // Dispose the ad here to free resources.
                ad.dispose();
              },
              // Called when a click is recorded for an ad.
              onAdClicked: (ad) {});
          // Keep a reference to the ad so you can show it later.
          if (Get.isDialogOpen == true) {
            Get.back();
          }
          _rewardedAd = ad;
          _showRewardedAd();
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (LoadAdError error) {
          if (Get.isDialogOpen == true) {
            Get.back();
          }
        },
      ),
    );
  }

  void _showRewardedAd() {
    _rewardedAd?.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
      Get.back();
      appService.pointsChange.value = 20;
      appService.resetGame = true;
      Utils.showProgressDialog("Please wait...");
    });
  }

  @override
  void onClose() async {
    await _rewardedAd?.dispose();
    super.onClose();
  }

  void buy100Points() async {
    if (!iapService.isConfiguredInApp) {
      return;
    }
    try {
      List<StoreProduct> products = await Purchases.getProducts(
          ["wzsit_199_100p"],
          productCategory: ProductCategory.nonSubscription);

      if (products.isNotEmpty) {
        await Purchases.purchaseStoreProduct(products[0]);
        Get.back();
        appService.pointsChange.value = 100;
        appService.resetGame = true;
        Utils.showProgressDialog("Please wait...");
      }
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }
}
