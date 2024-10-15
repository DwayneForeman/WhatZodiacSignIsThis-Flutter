import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:whatsignisthis/models/answer.dart';
import 'package:whatsignisthis/models/question.dart';
import 'package:whatsignisthis/routes/app_pages.dart';
import 'package:whatsignisthis/services/iap_service.dart';
import 'package:whatsignisthis/services/app_service.dart';
import 'package:whatsignisthis/utils/ads_helper.dart';
import 'package:whatsignisthis/utils/table_collection.dart';

class GamePlayController extends FullLifeCycleController with FullLifeCycleMixin, GetSingleTickerProviderStateMixin {
  late IAPService iapService;
  late AppService settings;
  BannerAd? bannerAd;
  InterstitialAd? _interstitialAd;
  final bannerLoaded = false.obs;
  final questionLoading = false.obs;
  final answerLoading = false.obs;
  String errorMessage = "";
  bool isBalloonActive = false;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Question> questionsList = [];
  final questionIndex = 0.obs;
  List<Answer> _answersList = [];
  List<Answer> currentAnswersList = [];
  int _adCounter = 0;
  final List<int> _audioIndexes = [1, 2, 3, 4];
  late AudioPlayer _player;
  int level = 1;

  GamePlayController() {
    settings = Get.find<AppService>();
    iapService = Get.find<IAPService>();
    _player = AudioPlayer()..setReleaseMode(ReleaseMode.loop);
  }

  @override
  void onInit() {
    level = Get.arguments as int;
    _loadBanner();
    _getQuestions();
    _getAnswers();
    super.onInit();
    if (settings.music.value) _player.play(AssetSource("audio/answer_look.mp3"));
  }

  void _loadBanner() {
    if (!iapService.isSubscriptionActive.value) {
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
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              if (settings.showUpgradePopup.value && !iapService.isSubscriptionActive.value) {
                settings.showUpgradePopup.value = false;
                Get.toNamed(Routes.UPGRADE);
              }
            },
          );
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (err) {
          debugPrint('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  Future<void> _getQuestions() async {
    questionLoading.value = true;
    await _db.collection(TableCollection.questions).where("level_id", isEqualTo: level).get().then((querySnapshot) {
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot = querySnapshot.docs;
      if (snapshot.isNotEmpty) {
        questionsList = snapshot.map<Question>((e) => Question.fromJson(e.data())).toList();
        questionsList.shuffle();
        questionLoading.value = false;
        _prepareAnswers();
      } else {
        errorMessage = "Question list is empty";
        questionLoading.value = false;
      }
    }).catchError((error) {
      errorMessage = "Sorry! Could not get data.";
      questionLoading.value = false;
    });
  }

  Future<void> _getAnswers() async {
    answerLoading.value = true;
    await _db.collection(TableCollection.answers).get().then((querySnapshot) {
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot = querySnapshot.docs;
      if (snapshot.isNotEmpty) {
        _answersList = snapshot.map<Answer>((e) => Answer.fromJson(e.data())).toList();
        _prepareAnswers();
      } else {
        debugPrint("Question list is empty");
        answerLoading.value = false;
      }
    }).catchError((error) {
      debugPrint("Question error: $error");
      answerLoading.value = false;
    });
  }

  void _prepareAnswers() {
    if (questionsList.isEmpty || questionIndex >= questionsList.length || _answersList.length > 12) {
      answerLoading.value = false;
      return;
    }

    //the answers who do not belong to any level or question
    if (!answerLoading.value) answerLoading.value = true;
    final incorrectAnswers = _answersList.where((element) {
      element.isDisabled = false;
      return !element.questionIds.contains(questionsList[questionIndex.value].questionId);
    }).toList();
    int length = incorrectAnswers.length;
    //unique random numbers
    List<int> numbers = List.generate(length, (index) => index);
    numbers.shuffle();
    currentAnswersList = List.generate(
      level == 1
          ? 3
          : level == 2
              ? 7
              : 11,
      (i) {
        final e = incorrectAnswers[numbers[i]];
        //disable answers when user tap on balloon
        if (isBalloonActive) {
          if ((level == 1) && (i < 2)) {
            e.isDisabled = true;
          } else if ((level == 2) && (i < 4)) {
            e.isDisabled = true;
          } else if ((level == 3) && (i < 6)) {
            e.isDisabled = true;
          } else {
            e.isDisabled = false;
          }
        } else {
          e.isDisabled = false;
        }
        return e;
      },
    );

    currentAnswersList.addAll(_answersList.where((element) {
      return element.questionIds.contains(questionsList[questionIndex.value].questionId);
    }).toList());
    currentAnswersList.shuffle();
    answerLoading.value = false;
    isBalloonActive = false;
  }

  void onTapBalloon() {
    if (settings.totalPoints.value > 5 && !isBalloonActive) {
      isBalloonActive = true;
      settings.pointsChange.value = -5;
      _prepareAnswers();
    }
  }

  void showResponseDialog(int index) {
    if (settings.totalPoints.value <= 0) {
      showGameOverDialog();
      return;
    }

    if (!(questionIndex < questionsList.length)) return;
    final answer = currentAnswersList[index];
    if (answer.isDisabled) return;

    bool correct = answer.questionIds.contains(questionsList[questionIndex.value].questionId);

    settings.pointsChange.value = correct ? 10 : -10;

    String audio = "";
    _audioIndexes.shuffle();
    if (correct) {
      audio = "audio/correct${_audioIndexes[0]}.mp3";
    } else {
      audio = "audio/wrong${_audioIndexes[0]}.mp3";
    }
    if (settings.music.value) _player.play(AssetSource(audio));
    Future.delayed(const Duration(seconds: 4), () {
      Get.back();
    });

    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: correct
                ? Container(
                    width: double.maxFinite,
                    height: Get.mediaQuery.size.width * 1.1,
                    decoration: const BoxDecoration(
                        color: Colors.transparent, image: DecorationImage(image: AssetImage("assets/images/CorrectAnswerDialogBg.png"), fit: BoxFit.fill)),
                    child: Stack(
                      children: [
                        Positioned(
                            left: 0,
                            right: 0,
                            top: Get.mediaQuery.size.width * 0.236,
                            child: Center(child: Image.network(answer.imageUrl, width: 70, height: 60))),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: Get.mediaQuery.size.width * 0.4,
                          child: Center(
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  colors: [Color(0xff2AF598), Color(0xff009EFD)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(bounds);
                              },
                              child: Text(
                                "Nice Work!",
                                style: TextStyle(fontFamily: "Cherry", fontSize: Get.mediaQuery.size.width * 0.11, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: 320,
                    decoration: const BoxDecoration(
                        color: Colors.transparent, image: DecorationImage(image: AssetImage("assets/images/IncorrectAnswer-Bg.png"), fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        const SizedBox(height: 90),
                        Image.network(answer.imageUrl, width: 70, height: 60),
                        const SizedBox(height: 15),
                        Text("${answer.answer} are...",
                            style: const TextStyle(fontFamily: "SF-Compact", fontWeight: FontWeight.w900, color: Color(0xffFF0909), fontSize: 24)),
                        const SizedBox(height: 10),
                        Text("${answer.trait[0]}\n${answer.trait[1]}\n${answer.trait[2]}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontFamily: "SF-Pro", fontWeight: FontWeight.w600, color: Color(0xff343434), fontSize: 18)),
                      ],
                    ),
                  ),
          );
        }).then((value) {
      if (settings.music.value) _player.play(AssetSource("audio/answer_look.mp3"));
      _adCounter++;
      if (_adCounter == 5) {
        _adCounter = 1;
        showInterstitial();

        // _rewardedAd?.show(
        //   onUserEarnedReward: (_, reward) {
        //     debugPrint("Ad Shown");
        //   },
        // );
      }
      if (questionIndex.value == 30) {
        Get.toNamed(Routes.UPGRADE);
      }
      if (settings.totalPoints.value == 30) {
        Get.toNamed(Routes.RATE_US);
      }
      if (questionsList.isNotEmpty) {
        if (questionIndex < (questionsList.length - 1)) {
          questionIndex.value++;
          _prepareAnswers();
        } else {
          questionIndex.value++;
        }
      }
    });
  }

  void showInterstitial() {
    if (!iapService.isSubscriptionActive.value) {
      _interstitialAd?.show();
      _loadInterstitialAd();
    }
  }

  void reset() {
    _prepareAnswers();
  }

  void showGameOverDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: Get.mediaQuery.size.width * 0.1),
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          width: Get.mediaQuery.size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                colors: [Color(0xff6A11CB), Color(0xff2575FC)],
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 40),
              Image.asset(
                "assets/images/game_over.png",
                width: Get.mediaQuery.size.width * 0.4,
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: Text(
                  "Let's get em again next time!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Divider(
                height: 1,
                color: Colors.white60,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (iapService.isSubscriptionActive.value) {
                    settings.pointsChange.value = 100;
                    Get.back();
                  } else {
                    Get.offNamed(Routes.GAME_OVER);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Center(
                      child: Text("Okay", style: TextStyle(fontFamily: "Avenir", fontWeight: FontWeight.normal, color: Color(0xffF2F2F2), fontSize: 16))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onClose() async {
    await bannerAd?.dispose();
    await _interstitialAd?.dispose();
    await _player.stop();
    await _player.release();
    await _player.dispose();
    super.onClose();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {
    debugPrint("onInactive");
  }

  @override
  void onPaused() {
    _player.pause();
  }

  @override
  void onResumed() {
    _player.resume();
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
