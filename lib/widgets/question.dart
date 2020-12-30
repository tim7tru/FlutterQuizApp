import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final List<int> factors;

  Question({this.factors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child:
        Text(
         "${factors[0]} * ${factors[1]}",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )
    );
  }
}