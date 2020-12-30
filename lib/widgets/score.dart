import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int currentScore;
  final int total; 

  Score({
    @required this.currentScore, 
    @required this.total
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black
          ),
          children: <TextSpan> [
            TextSpan(text: "Current score: "),
            TextSpan(
              text:"${currentScore}/${total}",
              style: TextStyle(fontWeight: FontWeight.bold) 
            )
          ]),
      )
    );
  }
}