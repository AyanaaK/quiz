import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/questions.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String onSelectAnswer) {
      widget.onSelectAnswer('...');
      setState(() {
        currentQuestionIndex++;
      });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30), // Space between question and answers
            // Add more space between each answer option
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap:(){
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }

}

