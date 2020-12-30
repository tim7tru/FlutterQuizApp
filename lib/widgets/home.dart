import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Function onStartPressed;

  Home({@required this.onStartPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
