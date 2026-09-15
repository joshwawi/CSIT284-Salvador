import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const QuizScreen(),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool isQuizStarted = false;
  int currentQuestionIndex = 0;

  final List<QuizQuestion> questions = [
    QuizQuestion(
      'What are the main building blocks of Flutter UIs?',
      ['Functions', 'Components', 'Blocks', 'Widgets'],
    ),
    QuizQuestion(
      'How are Flutter UIs built?',
      [
        'By combining widgets in a visual editor',
        'By using XCode for iOS and Android Studio for Android',
        'By combining widgets in code',
        'By defining widgets in config files',
      ],
    ),
    QuizQuestion(
      'What\'s the purpose of a StatefulWidget?',
      [
        'Render UI that does not depend on data',
        'Update data as UI changes',
        'Ignore data changes',
        'Update UI as data changes',
      ],
    ),
    QuizQuestion(
      'How should you update data inside of StatefulWidgets?',
      [
        'By calling setState()',
        'By calling updateData()',
        'By calling updateUI()',
        'By calling updateState()',
      ],
    ),
  ];

  void startQuiz() {
    setState(() {
      isQuizStarted = true;
      currentQuestionIndex = 0;
    });
  }

  void answerQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        isQuizStarted = false; // Returns back to start screen after last question
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isQuizStarted) {
      // START SCREEN
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
            const SizedBox(height: 80),
            const Text(
              'Learn Flutter the fun way!',
              style: TextStyle(
                color: Color.fromARGB(255, 237, 223, 252),
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz'),
            ),
          ],
        ),
      );
    }

    // QUIZ QUESTIONS SCREEN
    final currentQuestion = questions[currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 237, 223, 252),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.answers.map((answer) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: answerQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 33, 1, 95),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 40,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(answer, textAlign: TextAlign.center),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class QuizQuestion {
  final String text;
  final List<String> answers;

  QuizQuestion(this.text, this.answers);
}