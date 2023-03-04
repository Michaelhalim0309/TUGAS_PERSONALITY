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
      'question': 'Kapan kamu merasa baik?',
      'answers': [
        {'text': 'Pagi hari', 'score': 2},
        {'text': 'Siang hari', 'score': 4},
        {'text': 'Sore hari', 'score': 6},
        {'text': 'Malam hari', 'score': 8},
      ],
    },
    {
      'question': 'Bagaimana kamu biasanya berjalan?',
      'answers': [
        {'text': 'Cepat', 'score': 4},
        {'text': 'Agak cepat', 'score': 6},
        {'text': 'Agak lambat', 'score': 8},
        {'text': 'Jalan lambat', 'score': 2},
      ],
    },
    {
      'question':
          'Ketika kamu berbicara sama orang, biasanya kamu bersikap seperti apa?',
      'answers': [
        {
          'text':
              'Salah satu atau kedua tanganmu ada di pinggul atau masuk kantong',
          'score': 6
        },
        {'text': 'Kedua tangan kamu berpegangan', 'score': 4},
        {'text': 'Tidak memainkan apapun', 'score': 8},
        {'text': 'Angkat kaki sebelah', 'score': 2},
      ],
    },
    {
      'question': 'Ketika lagi santai, kamu duduk dengan?',
      'answers': [
        {'text': 'Kedua kaki menyilang', 'score': 4},
        {'text': 'Kaki kanan di atas kaki kiri', 'score': 6},
        {'text': 'Kaki kiri di atas kaki kanan', 'score': 8},
        {'text': 'Kedua kaki lurus', 'score': 2},
      ],
    },
    {
      'question':
          'Ketika sesuatu benar-benar membuatmu geli, kamu bereaksi seperti apa?',
      'answers': [
        {'text': 'Tertawa keras', 'score': 8},
        {'text': 'Ketawa saja', 'score': 6},
        {'text': 'Biasa aja', 'score': 2},
        {'text': 'Senyum', 'score': 4},
      ],
    },
    {
      'question':
          'Saat kamu pergi ke pesta, kamu biasanya menggunakan baju seperti apa?',
      'answers': [
        {'text': 'Biasa aja', 'score': 2},
        {'text': 'Asal rapi', 'score': 6},
        {'text': 'Paling oke', 'score': 8},
        {'text': 'Harus tampil paling oke', 'score': 4},
      ],
    },
    {
      'question':
          'Ketika kamu lagi fokus dan ada yang menganggu, maka kamu akan?',
      'answers': [
        {'text': 'Marah', 'score': 4},
        {'text': 'Menyambut', 'score': 6},
        {'text': 'Terganggu', 'score': 8},
        {'text': 'Diamin', 'score': 2},
      ],
    },
    {
      'question': 'Warna paling suka?',
      'answers': [
        {'text': 'Hitam', 'score': 4},
        {'text': 'Merah atau orange', 'score': 6},
        {'text': 'Kuning atau biru langit', 'score': 8},
        {'text': 'Cokelat atau abu-abu', 'score': 2},
      ],
    },
    {
      'question': 'Kamu sering bermimpi apa??',
      'answers': [
        {'text': 'Jatuh', 'score': 4},
        {'text': 'Berkelahi', 'score': 6},
        {'text': 'Mimpi indah', 'score': 8},
        {'text': 'Terbang', 'score': 2},
      ],
    },
    {
      'question': 'Cara tidur kamu gimana?',
      'answers': [
        {'text': 'Berbaring telentang', 'score': 4},
        {'text': 'Ke samping', 'score': 6},
        {'text': 'Kepala menindih tangan', 'score': 8},
        {'text': 'Kepala dibawah bantal', 'score': 2},
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
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          appBar: AppBar(title: const Text('PERSONALITY TEST MBTI')),
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
