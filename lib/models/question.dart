class Question {
  String uid;
  int questionId;
  int levelId;
  String question;

  Question(
      {required this.uid,
      required this.questionId,
      required this.levelId,
      required this.question});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      uid: json["uid"],
      questionId: json["question_id"],
      levelId: json["level_id"],
      question: json["question"],
    );
  }
}
