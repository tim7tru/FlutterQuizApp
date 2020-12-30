import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants.dart';

class Answer extends StatelessWidget {
  final Map<String, Object> product;
  final Function onAnswerPressed;

  Answer({this.product, this.onAnswerPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        color: Colors.lightBlue,
        textColor: Colors.white,
        child: Text(
          "${product[Constants.ANSWER_KEY]}",
          style: TextStyle(fontSize: 18.0),
        ),
        onPressed: () => onAnswerPressed(product[Constants.CORRECT_KEY]),
      ),
    );
  }
}
