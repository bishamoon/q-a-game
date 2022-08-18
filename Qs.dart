class Qs {
  String? _questionText;

  String? get questionText => _questionText;

  set questionText(String? questionText) {
    _questionText = questionText;
  }
  String? questionImage;
  bool? questionAnswer;

  /*Qs({this.questionText, this.questionImage, this.questionAnswer}) {}*/
  Qs({
    String? questionText,
    String? questionImage,
    bool? questionAnswer,
  }) {
    this.questionText = questionText;
    this.questionImage = questionImage;
    this.questionAnswer = questionAnswer;
  }
}
