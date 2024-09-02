import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/custom_text.dart';

class ResultsScreen extends StatelessWidget{

  const ResultsScreen({super.key, required this.choosenAnswers, required this.onRestart});

  final List<String> choosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
            
    final List<Map<String, Object>> summary = [];
      
      for(var i=0; i< choosenAnswers.length; i++){
        summary.add({
         'question_index': i,
         'question' : questions[i].text,
         'correct_answer' : questions[i].answers[0],
         'user_answer' : choosenAnswers[i]
        });
      }


    return summary;

  }

  @override
  Widget build(BuildContext context) {

    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
       width: double.infinity,
       child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly",
               18, 
               const Color.fromARGB(255, 233, 185, 245)
               ),  
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton.icon(
                onPressed: () {
                    onRestart();
                },
                icon: const Icon(
                  Icons.restart_alt, // You can choose any relevant icon
                  color: Colors.white,
                ),
                label: const CustomText(
                  "Restart Quiz",
                  16,
                  Colors.white,
                ),
            )
          ],
          ),
       ),
    );
  }
}