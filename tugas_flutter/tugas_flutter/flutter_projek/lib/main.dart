import 'package:flutter/material.dart';
import 'test_widget.dart';
import 'result.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _questionAnswersMap = [
    {
      'question': 'When you go somewhere for the day, would you rather',
      'answers': [
        {'text': 'Plan what you will do and when', 'score': 2},
        {'text': 'Just go!', 'score': 2},
      ],
    },
    {
      'question': 'If you were a teacher, would you rather teach',
      'answers': [
        {'text': 'Facts-based courses', 'score': 2},
        {'text': 'Courses involving opinion or theory', 'score': 2},
      ],
    },
    {
      'question': 'Are you usually',
      'answers': [
        {'text': 'A "good mixer" with groups of people', 'score': 2},
        {'text': 'Rather quiet and reserved', 'score': 2},
      ],
    },
    {
      'question': 'Do you more often let',
      'answers': [
        {'text': 'Your heart rule your head', 'score': 1},
        {'text': 'Your head rule your heart', 'score': 2},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _chooseAnswers(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    debugPrint('questionIndex: $_questionIndex ');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First App From Scratch",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
          appBar: AppBar(title: const Text('My First App From Scratch')),
          body: _questionIndex < _questionAnswersMap.length
              ? TestWidget(
                  questionAnswers: _questionAnswersMap,
                  questionIndex: _questionIndex,
                  chooseAnswerFunc: _chooseAnswers,
                )
              : Result(_totalScore, _resetQuiz)),
      debugShowCheckedModeBanner: false,
    );
  }
}
