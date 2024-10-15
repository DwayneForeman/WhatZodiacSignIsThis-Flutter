class Answer {
  late String uid;
  late List<dynamic> questionIds;
  late String answer;
  late String imageUrl;
  late List<dynamic> trait;
  late bool isDisabled;

  Answer() {
    uid = "";
    questionIds = [];
    answer = "";
    imageUrl = "";
    trait = [];
    isDisabled = false;
  }

  Answer.fromJson(Map<String, dynamic> json) {
    uid = json["uid"];
    questionIds = json["question_ids"];
    answer = json["answer"];
    imageUrl = json["image_url"];
    trait = json["trait"].split(',');
    isDisabled = false;
  }
}
