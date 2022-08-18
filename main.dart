import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
              backgroundColor: Colors.grey,
              title: Text(
                'Game',
                style: TextStyle(color: Colors.black),
              )),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ExamPage(),
          ),
        ));
  }
}

class ExamPage extends StatefulWidget {
  ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  void check(bool whatUserPick) {
    bool correct = appBrain.getAnswer();
    setState(() {
      if (whatUserPick == correct) {
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }
      if (appBrain.isFinshed() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Finshed",
          desc: "Complete!",
          buttons: [
            DialogButton(
              child: Text(
                "Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appBrain.reset();
        answerResult = [];
      } else {
        appBrain.nextQ();
      }
    });
  }

  List<Widget> answerResult = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(appBrain.getImage()),
              SizedBox(height: 20),
              Text(
                appBrain.getText(),
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: FlatButton(
            child: Text(
              'صح',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            color: Colors.indigo,
            onPressed: () {
              check(true);
            },
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: FlatButton(
            child: Text(
              'خطأ',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            color: Colors.deepOrange,
            onPressed: () {
              check(false);
            },
          ),
        ))
      ],
    );
  }
}
