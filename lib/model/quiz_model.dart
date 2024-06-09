class QuizModel
{
  String? qstnid;
  String category;
  String question;
  String option1;
  String option2;
  String option3;
  String option4;

  QuizModel({
    required this.category,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    this.qstnid,

  });

 Map<String, dynamic> toMap() => {
        "qstn_id": qstnid,
        "question": question,
        "option1": option1,
        "option2": option2,
         "option3": option3,
         "option4":option4,
         "category":category
         
      };

      factory QuizModel.fromMap(Map<String, dynamic> data) {
    return QuizModel(
      qstnid: data["qstn_id"],
      question: data["question"],
      option1: data["option1"],
      option2: data["option2"],
      option3: data["option3"],
      option4: data["option4"],
      category: data["category"]
    );
  }


}