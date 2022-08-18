import 'Qs.dart';

class AppBrain {
  int _qN = 0;
  List _questions = [
    Qs(
        questionText: 'عدد الواكب في المجموعة الشمسية هو ثمانية',
        questionAnswer: true,
        questionImage: 'assets/images/image-1.jpg'),
    Qs(
        questionText: 'القطط هي حيوانات لاحمة',
        questionAnswer: true,
        questionImage: 'assets/images/image-2.jpg'),
    Qs(
      questionText: 'الصين موجودة في قارة افريقيا',
      questionAnswer: false,
      questionImage: 'assets/images/image-3.jpg',
    ),
    Qs(
        questionText: 'الارض مسطحة وليست كروية',
        questionAnswer: false,
        questionImage: 'assets/images/image-4.jpg')
  ];

  String getText() {
    return _questions[_qN].questionText;
  }

  String getImage() {
    return _questions[_qN].questionImage;
  }

  bool getAnswer() {
    return _questions[_qN].questionAnswer;
  }

  void nextQ() {
    if (_qN < _questions.length - 1) {
      _qN++;
    }
  }

  bool isFinshed() {
    if (_qN >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _qN = 0;
  }
}
