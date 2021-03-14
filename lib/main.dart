// Point to Flutter packages
import 'package:flutter/material.dart';

// Point to Custom Widgets
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': "What's your favourite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 6},
        {'text': 'White', 'score': 4},
      ]
    },
    {
      'question': "What's your pet name?",
      'answers': [
        {'text': 'Puppy', 'score': 8},
        {'text': 'Coco', 'score': 10},
        {'text': 'Oreo', 'score': 10},
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print('Answer selected');
    print(_questionIndex);
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                selectHandler: _answerQuestion,
                qAndA: _questions[_questionIndex])
            : Result(_restartQuiz, _totalScore),
      ),
    );
  }
}
