import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int _firstDice = 1;
  int _secondDice = 1;

  void _shuffleDices() {
    _firstDice = _getRandom();
    _secondDice = _getRandom();
  }

  int _getRandom() {
    return 1 + Random().nextInt(6);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _dice(_firstDice),
        _dice(_secondDice),
      ],
    );
  }

  Widget _dice(int diceNumber) {
    return Expanded(
      child: FlatButton(
        child: Image.asset('images/dice$diceNumber.png'),
        onPressed: () {
          setState(() {
            _shuffleDices();
          });
        },
      ),
    );
  }
}
