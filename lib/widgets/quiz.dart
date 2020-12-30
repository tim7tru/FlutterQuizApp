import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';
import 'score.dart';

class Quiz extends StatelessWidget {
  final Function onAnswerPressed;
  final List<Map<String, Object>> products;
  final List<int> factors;
  final int score;
  final int questionCount;

  Quiz(
      {@required this.onAnswerPressed,
      @required this.products,
      @required this.factors,
      @required this.score,
      @required this.questionCount});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Score(
                currentScore: score,
                total: questionCount,
              ),
              Question(
                factors: factors,
              ),
              ...(products as List<Map<String, Object>>).map((product) {
                return Answer(
                  product: product,
                  onAnswerPressed: onAnswerPressed,
                );
              }).toList()
            ]));
  }
}
