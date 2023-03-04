import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Kuis extends StatelessWidget {
  final List questionAnswers;
  final int questionIndex;
  final Function answerQuestionFunc;

  const Kuis(
      {required this.questionAnswers,
      required this.questionIndex,
      required this.answerQuestionFunc,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionAnswers[questionIndex]['question'].toString()),
        ...(questionAnswers[questionIndex]['answers']
                as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestionFunc(answer['score']),
              answer['text'] as String);
        }).toList(),
      ],
    );
  }
}
