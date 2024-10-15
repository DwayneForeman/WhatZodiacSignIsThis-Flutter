import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:whatsignisthis/services/iap_service.dart';
import 'package:whatsignisthis/utils/ads_helper.dart';

class LevelSelectController extends GetxController {
  final iapService = Get.find<IAPService>();
  BannerAd? bannerAd;
  final bannerLoaded = false.obs;
  

  @override
  void onInit() {
    loadBanner();
    super.onInit();
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

  @override
  void onClose() {
    bannerAd?.dispose();
    super.onClose();
  }
}
