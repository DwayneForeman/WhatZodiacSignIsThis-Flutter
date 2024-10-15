import '/models/user.dart';

class LeaderboardModel {
  String uid;
  int points;
  UserModel userModel;

  LeaderboardModel(
      {required this.uid, required this.points, required this.userModel});

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardModel(
        uid: json["uid"],
        points: json["points"],
        userModel: UserModel.fromJson(json));
  }
}
