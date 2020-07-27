class Question {
  String questionText;
  bool questionAnswer;

  Question(String q, bool a) {
    questionText = q;
    questionAnswer = a;
  }
  // the question constructor can also be written as

  // Question(String questiontext , bool questionanswer)
  // { this.questiontext = questiontext;
  // this.questionanswer= question.answer;
  // }

  // OR

  // Question(this.questiontext, this.questionanswer);
}
