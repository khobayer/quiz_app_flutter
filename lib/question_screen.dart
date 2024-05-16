import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSeletedAnswer});

  final void Function(String answer) onSeletedAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentAnswerIndex = 0;

  void answerQuestions(String seletedAnswer) {
    widget.onSeletedAnswer(seletedAnswer);

    setState(() {
      currentAnswerIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQurestion = questions[currentAnswerIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQurestion.text,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQurestion.mixedAnswer.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestions(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
