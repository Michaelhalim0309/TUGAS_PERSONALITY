import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {super.key});

  String get resultPhrase {
    String resultText;
    if (resultScore >= 50) {
      resultText = 'Paling debest dan mantul kamu nak!';
    } else if (resultScore <= 49) {
      resultText = 'Could be better!';
    } else {
      resultText = 'Kurang dari yang lain!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          'Skor kamu: $resultScore',
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          'Personality kamu: $resultPhrase',
          style: const TextStyle(fontSize: 40),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 83, 77, 78),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            onPressed: resetHandler,
            child: const Text('Coba lagi?',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                )))
      ],
    ));
  }
}
