import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Function onStartPressed;
  final int currentHighScore;
  final double averageHighScore;

  Home(
    {@required this.onStartPressed,
    @required this.currentHighScore,
    @required this.averageHighScore}
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Current high score: ${currentHighScore}",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "Average score: ${averageHighScore}",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "Product Quiz",
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
              RaisedButton(
                color: Colors.lightBlue,
                textColor: Colors.white,
                child: Text("Start quiz!"),
                onPressed: onStartPressed,
              )
            ]));
  }
}
