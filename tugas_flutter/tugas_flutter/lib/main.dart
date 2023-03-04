import 'package:flutter/material.dart';
import 'kuis.dart';
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
  final _soalJawaban = const [
    {
      'question':
          'Ketika membuat suatu perencanaan. Saya yakin dapat melaksanakan rencana tersebut!',
      'answers': [
        {'text': 'Sangat setuju', 'score': 15},
        {'text': 'Setuju', 'score': 8},
        {'text': 'Kurang setuju', 'score': 4},
        {'text': 'Tidak setuju', 'score': 2},
      ],
    },
    {
      'question':
          'Saya terkadang tidak bisa segera mulai bekerja ketika saya seharusnya melakukannya!',
      'answers': [
        {'text': 'Sangat setuju', 'score': 15},
        {'text': 'Setuju', 'score': 8},
        {'text': 'Kurang setuju', 'score': 4},
        {'text': 'Tidak setuju', 'score': 2},
      ],
    },
    {
      'question':
          'Ketika saya gagal melaksanakan tugas untuk pertama kali, maka saya gigih mencobanya sampai berhasil melakukannya!',
      'answers': [
        {'text': 'Sangat setuju', 'score': 15},
        {'text': 'Setuju', 'score': 8},
        {'text': 'Kurang setuju', 'score': 4},
        {'text': 'Tidak setuju', 'score': 2},
      ],
    },
    {
      'question':
          'Saya menyerah ketika melakukan sesuatu sebelum saya menyelesaikannya!',
      'answers': [
        {'text': 'Sangat setuju', 'score': 15},
        {'text': 'Setuju', 'score': 8},
        {'text': 'Kurang setuju', 'score': 4},
        {'text': 'Tidak setuju', 'score': 2},
      ],
    },
    {
      'question':
          'Saya jarang mencapai tujuan-tujuan penting yang sudah saya tetapkan sebelumnya!',
      'answers': [
        {'text': 'Sangat setuju', 'score': 15},
        {'text': 'setuju', 'score': 8},
        {'text': 'Kurang setuju', 'score': 4},
        {'text': 'Tidak setuju', 'score': 2},
      ],
    },
    {
      'question': 'Saya takut akan kesulitan dan selalu menghindarinya!',
      'answers': [
        {'text': 'Sangat setuju', 'score': 15},
        {'text': 'Setuju', 'score': 8},
        {'text': 'Kurang setuju', 'score': 4},
        {'text': 'Tidak setuju', 'score': 2},
      ],
    },
    {
      'question':
          'Jika saya menemui sesuatu pekerjaan yang terlihat sulit, saya tak mau mencoba melakukan pekerjaan tersebut!',
      'answers': [
        {'text': 'Sangat setuju', 'score': 15},
        {'text': 'Setuju', 'score': 8},
        {'text': 'Kurang setuju', 'score': 4},
        {'text': 'Tidak setuju', 'score': 2},
      ],
    },
    {
      'question':
          'Jika mencoba hal baru dan tidak berhasil, saya segera menyerah!',
      'answers': [
        {'text': 'Sangat setuju', 'score': 15},
        {'text': 'Setuju', 'score': 8},
        {'text': 'Kurang setuju', 'score': 4},
        {'text': 'Tidak setuju', 'score': 2},
      ],
    },
    {
      'question':
          'Saya menghindari mencoba sesuatu yang baru jika terlihat rumit dan kompleks!',
      'answers': [
        {'text': 'Sangat setuju', 'score': 15},
        {'text': 'Setuju', 'score': 8},
        {'text': 'Kurang setuju', 'score': 4},
        {'text': 'Tidak setuju', 'score': 2},
      ],
    },
    {
      'question':
          'Ketika terlibat dalam suatu proyek bersama, saya sering menjadi pencetus gagasan!',
      'answers': [
        {'text': 'Sangat setuju', 'score': 15},
        {'text': 'Setuju', 'score': 8},
        {'text': 'Kurang setuju', 'score': 4},
        {'text': 'Tidak setuju', 'score': 2},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _questionAnswers(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex++;
    });
    debugPrint('questionIndex: $_questionIndex ');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: const Text('PERSONALITY TEST MBTI'),
            backgroundColor: const Color.fromARGB(255, 227, 5, 5),
          ),
          body: _questionIndex < _soalJawaban.length
              ? Kuis(
                  questionAnswers: _soalJawaban,
                  questionIndex: _questionIndex,
                  answerQuestionFunc: _questionAnswers,
                )
              : Result(_totalScore, _resetQuiz)),
      debugShowCheckedModeBanner: false,
    );
  }
}
