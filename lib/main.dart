import 'package:flutter/material.dart';
import 'package:lab_02/clothes_answer.dart';
import 'package:lab_02/clothes_data.dart';
import 'package:lab_02/clothes_question.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _onNextQuestion() {
    if(_questionIndex < 4) {
      setState(() {
        _questionIndex++;
      });
    }
  }

  String _getQuestion() {
    return ClothesData.questions[_questionIndex]['question'] as String;
  }

  Widget? _getAnswer(answer) {
    return (_questionIndex < 4) ? ClothesAnswer(_onNextQuestion, answer) : ClothesAnswer(null, answer);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clothes Application',
      home: Scaffold(
        appBar: AppBar(title: const Text('MIS Laboratory exercise 2')),
        body: Column(
          children: [
            const SizedBox(height: 50),
            ClothesQuestion(_getQuestion()),
            const SizedBox(height: 50),
            ...(ClothesData.questions[_questionIndex]['answer'] as List<String>)
                .map((answer) {
                  return _getAnswer(answer)!;
            })
          ],
        ),
      ),
    );
  }
}
