import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function selectHandler;
  final Map qAndA;
  Quiz({@required this.selectHandler, @required this.qAndA});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(qAndA['question']),
        ...(qAndA['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => selectHandler(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
