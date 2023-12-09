import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_summary.dart';

// Text(((data['question_index'] as int) + 1).toString()),
class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choseAnswers,
    required this.onRestart
  });

  final void Function() onRestart;
  final List<String> choseAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choseAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choseAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = questions.length;
    final numCorrectAnswer = summaryData.where((data) => data['correct_answer'] == data['user_answer']).length;
    return Container(
      padding: const EdgeInsets.all(30),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answers $numCorrectAnswer out of $numTotalQuestion questions correctly!',
                style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: onRestart,
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(26, 255, 255, 255),
                ),
                icon: const Icon(Icons.restart_alt, color: Colors.white),
                label: Text(
                  'Restart quiz',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
