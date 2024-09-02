import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results-screen';
      });
    }

  }

  void onRestart(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {

    Widget screenWidget = StartScreen(switchScreen);    

    if(activeScreen == 'questions-screen'){
        screenWidget =  QuestionsScreen(onSelectAnswer: chooseAnswer);
    }     

    if(activeScreen == 'results-screen'){
        screenWidget =  ResultsScreen(
          choosenAnswers: selectedAnswers,
          onRestart: onRestart);
    }     

     return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color.fromARGB(255, 84, 19, 128),
            body: Scaffold(
                body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 84, 56, 161), // Start color
                    Color.fromARGB(255, 85, 5, 109) // End color
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: screenWidget ,
            )
          )
        )
      );
   }
}
