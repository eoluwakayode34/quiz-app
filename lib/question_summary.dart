import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
  
    return 
     SizedBox(
       height: 400,
       child: SingleChildScrollView(
         child: Column(
          children: [
            ...summaryData.map((data) {
              return Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                
                      child: Container(
                        alignment: Alignment.center,
                        decoration:  BoxDecoration(
                          color:  data['correct_answer'] == data['user_answer'] ? Colors.blue :  const Color.fromARGB(255, 238, 141, 255),
                          shape: BoxShape.circle
                
                        ),
                        child: Text(((data['question_index'] as int) + 1).toString(), 
                        style: GoogleFonts.lato(fontSize: 16, color: Colors.white),),
                
                
                        )),
                        const SizedBox(width: 20,),
                   Expanded(child:   Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String, style: GoogleFonts.lato(
                          color: Colors.white
                        ),
                        textAlign: TextAlign.left),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['correct_answer'] as String, 
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 240, 163, 253),
                        ),
                        ),
                        Text(data['user_answer'] as String, 

                         style: GoogleFonts.lato(
                          color:  const Color.fromARGB(255, 140, 200, 249)
                        ),
                      ),
                      ],
                    ))
                  
                  ],
                ),
              );
            }).toList()
          ],
             ),
       ),
     );
  }
}
