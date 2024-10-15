import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:whatsignisthis/models/user.dart';
import 'package:whatsignisthis/routes/app_pages.dart';
import 'package:whatsignisthis/screens/play/game_play_controller.dart';
import 'package:whatsignisthis/utils/constants.dart';
import 'package:whatsignisthis/utils/table_collection.dart';
import 'package:whatsignisthis/utils/utils.dart';

class AppService extends GetxService {
  late GetStorage _box;
  final intro = true.obs;
  final music = true.obs;
  final rank = 0.obs;
  final notify = true.obs;
  final showUpgradePopup = false.obs;
  final pointsChange = 0.obs;
  final totalPoints = 0.obs;
  bool resetGame = false;

  final user = UserModel().obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  bool deleteWarning = false;

  Future<AppService> init() async {
    await GetStorage.init();
    _box = GetStorage();
    intro.value = _box.read<bool>(Constants.KEY_INTRODUCTION) ?? true;
    music.value = _box.read<bool>(Constants.KEY_MUSIC) ?? true;
    notify.value = _box.read<bool>(Constants.KEY_NOTIFICATION) ?? true;
    showUpgradePopup.value = _box.read<bool>(Constants.KEY_UPGRADE_POPUP) ?? true;
    intro.listen((value) {
      _box.write(Constants.KEY_INTRODUCTION, value);
    });
    music.listen((value) {
      _box.write(Constants.KEY_MUSIC, value);
    });
    notify.listen((value) {
      _box.write(Constants.KEY_NOTIFICATION, value);
    });
    showUpgradePopup.listen((value) {
      _box.write(Constants.KEY_UPGRADE_POPUP, value);
    });
    pointsChange.listen((pts) {
      if (isLoggedIn && pts != 0) {
        _db.collection(TableCollection.leaderBoard).doc(FirebaseAuth.instance.currentUser?.uid).set({
          'uid': FirebaseAuth.instance.currentUser?.uid,
          'points': FieldValue.increment(pts),
        }, SetOptions(merge: true)).then((value) {
          totalPoints.value += pts;
          pointsChange.value = 0;
          if (resetGame) {
            resetGame = false;
            Get.find<GamePlayController>().reset();
          }
          if (Get.isDialogOpen == true) {
            Get.back();
          }
        });
      }
    });
    getUserProfile();
    return this;
  }

  bool get isLoggedIn => auth.currentUser != null;

  User? get firebaseUser => auth.currentUser;

  void toggleMusic() {
    music.value = !music.value;
  }

  Future<void> getUserProfile() async {
    if (isLoggedIn) {
   await   FirebaseFirestore.instance.collection(TableCollection.users).doc(auth.currentUser?.uid).get().then((snapShot) {
        final data = snapShot.data();
        if (data != null) {
          print("Error >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${user.value}");
          user.value = UserModel.fromJson(data);
          getLeaderBoard();
        }
      });
    }
  }

  void updateUserProfile() {
    Utils.showProgressDialog("Please wait...");
    _db.collection(TableCollection.users).doc(user.value.uid).set({
      "uid": user.value.uid,
      "image_url": user.value.imageUrl,
      "name": user.value.name,
      "email": user.value.email,
      "phone": user.value.phone,
    }, SetOptions(merge: true)).then((value) {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      if (Get.isBottomSheetOpen == true) {
        Get.back();
      }
      user.refresh();
    }).onError((error, stackTrace) {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      if (Get.isBottomSheetOpen == true) {
        Get.back();
      }
    });
  }

  Future<void> getLeaderBoard() async {
    if (user.value.uid.isNotEmpty) {
      await _db.collection(TableCollection.leaderBoard).doc(user.value.uid).get().then((docSnapShot) {
        if (docSnapShot.exists) {
          var pts = docSnapShot.get("points");
          _db
              .collection(TableCollection.leaderBoard)
              .where('points', isGreaterThan: pts)
              .orderBy("points")
              .count()
              .get()
              .then((querySnapshot) {
            totalPoints.value = pts;

            rank.value = (querySnapshot.count! + 1);
            print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${rank.value}");
          }).onError((error, stackTrace) {});
        } else {}
      }).onError((error, stackTrace) {});
    }
  }

  Future<void> deleteAccount() async {
    if (firebaseUser != null) {
      Utils.showProgressDialog("Please wait...");
      await   FirebaseFirestore.instance.collection(TableCollection.users).doc(auth.currentUser?.uid).delete().then((value) async {
        await    firebaseUser?.delete().then((value) {
          _db.collection(TableCollection.leaderBoard).doc(auth.currentUser?.uid).delete().then((value) {
            _db.collection(TableCollection.users).doc(auth.currentUser?.uid).delete().then((value) {});
          });
          if (Get.isDialogOpen == true) {
            Get.back();
            Get.offAllNamed(Routes.HOME);
          }
        });
      }).catchError((error) {
        deleteWarning = true;
        if (Get.isDialogOpen == true) {
          Get.back();
        }
      });
    }
  }

  @override
  void onClose() {
    music.close();
    totalPoints.close();
    intro.close();
    notify.close();
    showUpgradePopup.close();
    rank.close();
    user.close();
    super.onClose();
  }
}
