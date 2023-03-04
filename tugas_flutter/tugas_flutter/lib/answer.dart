import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 40, right: 30, top: 20, bottom: 10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black, width: 3),
          backgroundColor: const Color.fromARGB(255, 83, 77, 78),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        onPressed: selectHandler,
        child: Text(answerText,
            style: const TextStyle(
              fontSize: 28,
              color: Color.fromARGB(255, 248, 248, 248),
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
