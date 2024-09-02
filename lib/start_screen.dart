import 'package:flutter/material.dart';
import 'package:quiz_app/custom_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;


   @override
  Widget build(context) {
    return  Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/quiz-logo.png',
                    width: 300,
                    height: 300,
                  ),
                  const SizedBox(height: 60),
                  const CustomText('Learn Flutter the fun way!', 24,Color.fromARGB(255, 233, 178, 247)),
                  const SizedBox(
                    height: 30,
                  ),
                  OutlinedButton.icon(
                      onPressed: startQuiz ,
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(
                                color: Color.fromARGB(
                                    255, 255, 255, 255)), // Outline color
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.arrow_right_alt),
                      label: const CustomText('Start Quiz', 17,Color.fromARGB(255, 233, 178, 247)))
                ]
          ,));
}
}
