import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/quiz-logo.png',
            color: const Color.fromARGB(94, 255, 255, 255),
            width: 200,
          ),
          const SizedBox(
            height: 30,
          ),
           Text(
            'Learn flutter the flutter way',
            style :GoogleFonts.montserrat(
              color: Colors.white,  
              fontSize: 24
            )),
         
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            icon: const Icon(Icons.arrow_back_sharp),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                shadowColor: Colors.white,
                textStyle: const TextStyle(color: Colors.white)),
            label: const Text('Click me'),
          )
        ],
      ),
    );
  }
}
