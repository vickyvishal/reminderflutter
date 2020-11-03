import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

// void main(List<String> args) {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex =
      0; //_ means this variable is only accesible in the same class,
  //its called private property or if it is only in the main.dart file not outside

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        "questionText": "What is your favorite color",
        "answers": ["Red", "Black"]
      },
      {
        "questionText": "What is your favorite food",
        "answers": ["Pizza", "Biriyani"]
      },
      {
        "questionText": "What is your favorite countries",
        "answers": ["India", "Germany"]
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]["questionText"],
            ), //like passing props in react
            //Question is an component created by us
            ...(questions[_questionIndex]["answers"] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
