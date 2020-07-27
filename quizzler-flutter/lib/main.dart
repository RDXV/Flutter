import 'package:flutter/material.dart';
import 'quiz_brain.dart';
// import 'question.dart';

Quizbrain quiz = Quizbrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Empty list created

  // int quesno = 0;
  // Rather than changing the quesno insdie the main.dart we put it inside quiz_brain.dart
  List<Icon> scorekeeper = [
    // Instead of widgets, you  can specify icons inside the '<>' brackets as icons are also widgets and
    // are more specific to the widget keyword
  ];

  int iconno = 0;
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];

  // List<bool> answers = [false, true, true];

  // question q1 =
  //     question('You can lead a cow down stairs but not up stairs.', false);
// Creating object of  class question giving the values

// Now , q1 has 2 paramters. 1. q1.ques for the string-> question and q1.ans for the bool answers

  // List<question> quesbank = [
  //   question('You can lead a cow down stairs but not up stairs.', false),
  //   question('Approximately one quarter of human bones are in the feet.', true),
  //   question('A slug\'s blood is green.', true)
  // ];

  void checkans(bool correctanswer, bool answer) {
    // if (answers[qno] == ans) {
    // if (quiz.quesbank[qno].ans == answer) {
    setState(() {
      if (correctanswer == answer) {
        scorekeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scorekeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      // checkans(quesno, false);
      quiz.nextques();
      // quesno = quesno % 13;
    });

    // quesno++;
    // quiz.nextques(); Done in setstate()
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // questions.elementAt(quesno),
                // OR
                // questions[quesno],

                // quiz.quesbank[quesno].ques,
                quiz.questext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                // The state is changed and so item to be placed inside setstate() otherwise error
                // setState(() {
                //   scorekeeper.add(
                //     Icon(
                //       Icons.check,
                //       color: Colors.green,
                //     ),
                //   );
                // });

                bool correctanswer = quiz.quesanswer();
                checkans(correctanswer, true);
                // if (correctanswer == true) {
                //   scorekeeper.add(
                //     Icon(
                //       Icons.check,
                //       color: Colors.green,
                //     ),
                //   );
                // } else {
                //   scorekeeper.add(
                //     Icon(
                //       Icons.close,
                //       color: Colors.red,
                //     ),
                //   );
                // }

                // setState(() {
                // checkans(quesno, true);

                // quiz.nextques();
                // if (answers[quesno] == true) {
                //   scorekeeper.add(
                //     Icon(
                //       Icons.check,
                //       color: Colors.green,
                //     ),
                //   );
                // } else {
                //   scorekeeper.add(
                //     Icon(
                //       Icons.close,
                //       color: Colors.red,
                //     ),
                //   );
                // }
                // quesno++;
                // quesno = quesno % 13;
                // });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctanswer = quiz.quesanswer();
                checkans(correctanswer, false);
              },
            ),
          ),
        ),
        Row(
          // Now the children: requires a list and here scorekeeper is already a list and so it matches the
          // values required but it is a dynamic widget whereas we require  widget list

          // To remove this problem, inside declaration of list specify the type as -
          // list<widget> score = [...];
          children: scorekeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
