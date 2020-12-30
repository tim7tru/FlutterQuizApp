import 'package:flutter/material.dart';
import 'package:quiz_app/utils/productUtils.dart';

import 'utils/productUtils.dart';
import 'widgets/quiz.dart';
import 'widgets/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  ProductUtils _math = ProductUtils();
  List<int> _currentFactors;
  List<Map<String, Object>> _currentProducts;
  bool _hasStarted = false;
  int _totalScore = 0;
  int _questionCount = 0;

  void _onStartPressed() {
    setState(() {
      _hasStarted = true;
      _currentFactors = _math.getFactors();
      _currentProducts =_math.getProductList(_currentFactors);
    });
  }

  void _onAnswerPressed(bool correct) {
    setState(() {
      if (correct) {
        _totalScore++;
      }
      _questionCount++;
      _currentFactors = _math.getFactors();
      _currentProducts = _math.getProductList(_currentFactors);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter Product Quiz App"),
      ),
      body: _hasStarted
          ? Quiz(
              products: _currentProducts,
              factors: _currentFactors,
              onAnswerPressed: _onAnswerPressed,
              score: _totalScore,
              questionCount: _questionCount)
          : Home(
              onStartPressed: _onStartPressed,
            ),
    ));
  }
}