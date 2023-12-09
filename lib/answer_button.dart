import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.ontap,
  });
  final String answerText;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(
            padding:const  EdgeInsets.only(top: 20, bottom: 20),
            
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                color: Colors.purple
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
          child: Text(answerText,
          textAlign: TextAlign.center,
           style: const TextStyle(
            color: Colors.purple,
            
          ),)),
    );
  }
}
