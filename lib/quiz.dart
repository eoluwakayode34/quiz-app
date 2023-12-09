import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_screen.dart';
import 'package:quizapp/results_screen.dart';
import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnwswers = [];

  // Widget? activeScreen;
  var activeScreen = 'start-screen';

// @override
//   void initState() {
//     activeScreen =  StartScreen(switchScreen);
//     super.initState();
//   }
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnwswers.add(answer);

    if (selectedAnwswers.length == questions.length) {
      setState(() {
        // selectedAnwswers = [];
        activeScreen = 'result-screen';
      });
    }
  }
  void restartQuiz() {

      setState(() {
        selectedAnwswers = [];
        activeScreen = 'start-screen';
      });
    
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = activeScreen == 'start-screen'
        ? StartScreen(() {
            switchScreen();
          })
        : QuestionsScreen(onSelectAnswer: chooseAnswer);

    if (activeScreen == 'result-screen') {
      screenWidget =  ResultScreen(choseAnswers: selectedAnwswers, onRestart: restartQuiz);
    }
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.purple,
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: screenWidget,
            )));
  }
}
