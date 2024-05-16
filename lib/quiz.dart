import 'package:flutter/material.dart';

import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> seletedAnswers = [];
  var activeScreen = 'start-screen';

  void changeScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswe(String answer) {
    seletedAnswers.add(answer);

    if (seletedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      seletedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(contex) {
    Widget screenWidget = StartScreen(changeScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSeletedAnswer: chooseAnswe,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(choosenAnswer: seletedAnswers, onRestart: restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 37, 11, 83),
                Color.fromARGB(255, 92, 12, 124),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
