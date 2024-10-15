import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:whatsignisthis/models/leader_bord_model.dart';
import 'package:whatsignisthis/models/user.dart';
import 'package:whatsignisthis/utils/table_collection.dart';
import 'package:whatsignisthis/utils/utils.dart';

class LeaderBoardController extends GetxController {
  final boardList = <LeaderboardModel>[].obs;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 200), () => _getLeaderBoard());
  }

  void _getLeaderBoard() {
    List<LeaderboardModel> list = [];
    Utils.showProgressDialog("Please wait...");
    _db.collection(TableCollection.leaderBoard).orderBy("points",descending: true).limit(10).get().then((docSnapShot) async {
      if (docSnapShot.docs.isEmpty) {
        if (Get.isDialogOpen == true) {
          Get.back();
          return;
        }
      }
      for (var doc in docSnapShot.docs) {
        DocumentSnapshot<Map<String, dynamic>> snapshot = await _db.collection(TableCollection.users).doc(doc.id).get();
        var data = snapshot.data();
        if (data != null) {
          var uid = doc.get("uid");
          var points = doc.get("points");
          if (points > 0) {
            var user = UserModel.fromJson(data);
            list.add(LeaderboardModel(uid: uid, points: points, userModel: user));
          }
        }
      }
      list.sort((e1, e2) => e2.points.compareTo(e1.points));
      boardList.value = list;
      if (Get.isDialogOpen == true) {
        Get.back();
      }
    }).onError((error, stackTrace) {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
    });
  }
}
