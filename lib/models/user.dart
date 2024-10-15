class UserModel {
  String uid;
  int serialId;
  String name;
  String phone;
  String email;
  String imageUrl;

  UserModel(
      {this.uid = "",
      this.serialId = 0,
      this.name = "",
      this.phone = "",
      this.email = "",
      this.imageUrl = ""});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json["name"] ?? "",
        phone: json["phone"],
        email: json["email"] ?? "",
        uid: json["uid"] ?? "",
        serialId: json["serial_id"] ?? 0,
        imageUrl: json["image_url"] ?? "");
  }
}
