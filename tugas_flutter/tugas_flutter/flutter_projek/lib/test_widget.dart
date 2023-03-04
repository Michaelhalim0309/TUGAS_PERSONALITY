import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class TestWidget extends StatelessWidget {
  final List questionAnswers;
  final int questionIndex;
  final Function chooseAnswerFunc;

  const TestWidget(
      {required this.questionAnswers,
      required this.questionIndex,
      required this.chooseAnswerFunc,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionAnswers[questionIndex]['question'] as String),
        ...(questionAnswers[questionIndex]['answers'] as List).map((answer) {
          // print(answer);
          return Answer(
              () => chooseAnswerFunc(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
