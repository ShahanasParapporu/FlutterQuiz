import 'package:flutter/material.dart';
import 'package:quiz_app/custom_text.dart';


class QuestionsSummary extends StatelessWidget{

  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data){
              bool isCorrect = data['user_answer'] == data['correct_answer'];
              return Row(
                children: [
                  Container(
                    width: 25, 
                    height: 25,
                    decoration:BoxDecoration(
                      color: isCorrect ? const Color.fromARGB(255, 122, 202, 248) : const Color.fromARGB(255, 250, 133, 221), // Replace with your dynamic color
                      shape: BoxShape.circle, 
                    ),
                    child: Center(
                      child: CustomText(
                        ((data['question_index'] as int) + 1).toString(),
                         15, 
                       Colors.black
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomText(
                           data['question'] as String,
                            15, 
                          Colors.white
                           ),
                          const SizedBox(height: 5,),
                          CustomText(
                           data['user_answer'] as String,
                            15, 
                          const Color.fromARGB(255, 178, 125, 240)
                           ),
                          CustomText(
                           data['correct_answer'] as String,
                            15, 
                          const Color.fromARGB(255, 122, 202, 248)
                           ),
                           const SizedBox(height: 25,)
                        ]
                      ),
                    ),
                  )
                ],
              );
            }
          ).toList(),
        ),
      ),
    );
  }
}