import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restartQuiz;
  Result(this.restartQuiz, this.resultScore);

  String get resultPhrase {
    return resultScore > 18 ? 'You are awesome!' : 'You did it';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultScore.toString(),
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.orange),
            textAlign: TextAlign.center,
          ),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: Colors.blue, side: BorderSide(color: Colors.blue)),
            child: Text('Restart Quiz'),
            onPressed: restartQuiz,
          ),
        ],
      ),
    );
  }
}
