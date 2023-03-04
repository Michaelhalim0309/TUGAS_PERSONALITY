import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {super.key});

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 40, bottom: 40),
          child: Column(
            children: <Widget>[
              Text(
                'My personality score is $resultScore',
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'My personality type is $resultPhrase',
                style: const TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: resetHandler,
                child: const Text('Restart Quiz!'),
              )
            ],
          )),
    );
  }
}
