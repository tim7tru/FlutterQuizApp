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

  double _currentAverageScore = 0;

  int _currentTotalScore = 0;
  int _totalScore = 0;
  int _questionCount = 0;
  int _currentHighScore = 0;
  int _timesPlayed = 0;

  void _onStartPressed() {
    setState(() {
      _hasStarted = true;
      _currentFactors = _math.getFactors();
      _currentProducts =_math.getProductList(_currentFactors);
    });
  }

  void _onAnswerPressed(bool correct) {
    setState(() {
      _questionCount++;
      if (_questionCount > 10) {
        _resetQuiz();
      } 
      if (correct) {
        _currentTotalScore++;
      }
      _currentFactors = _math.getFactors();
      _currentProducts = _math.getProductList(_currentFactors);
    });
  }

  void _resetQuiz() {
    _totalScore += _currentTotalScore;
    _timesPlayed++;
    _currentAverageScore = _totalScore / _timesPlayed;

    if (_currentTotalScore > _currentHighScore) {
      _currentHighScore = _currentTotalScore;
    }

    _currentTotalScore = 0;
    _currentAverageScore = _currentHighScore / _timesPlayed;
    _questionCount = 0;
    _hasStarted = false;
  }

  Widget bodyDecision() {
    if (!_hasStarted) {
      return Home(
        onStartPressed: _onStartPressed,
        currentHighScore: _currentHighScore,
        averageHighScore: _currentAverageScore);
    } else {
      return Quiz(
              products: _currentProducts,
              factors: _currentFactors,
              onAnswerPressed: _onAnswerPressed,
              score: _currentTotalScore,
              questionCount: _questionCount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter Product Quiz App"),
      ),
      body: bodyDecision(),
    ));
  }
}