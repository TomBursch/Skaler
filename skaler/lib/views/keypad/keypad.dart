import 'package:flutter/material.dart';
import 'keyButton.dart';
import 'package:skaler/models/models.dart';

class Keypad extends StatelessWidget{
  final void Function(Operations, {int value}) onEnter;

  Keypad({@required this.onEnter});

  void onKeyPressed(String txt){
    var value = int.tryParse(txt);
    if(value != null){
      onEnter(Operations.number, value: value);
    } else {
      onEnter(_stringToOperations(txt));
    }
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Expanded(child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            KeyButton(text: "7", onPressed: onKeyPressed,),
            KeyButton(text: "8", onPressed: onKeyPressed,),
            KeyButton(text: "9", onPressed: onKeyPressed,),
            KeyButton(text: "/", onPressed: onKeyPressed,),
          ],
        )),
        Expanded(child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            KeyButton(text: "4", onPressed: onKeyPressed,),
            KeyButton(text: "5", onPressed: onKeyPressed,),
            KeyButton(text: "6", onPressed: onKeyPressed,),
            KeyButton(text: "x", onPressed: onKeyPressed,),
          ],
        )),
        Expanded(child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            KeyButton(text: "1", onPressed: onKeyPressed,),
            KeyButton(text: "2", onPressed: onKeyPressed,),
            KeyButton(text: "3", onPressed: onKeyPressed,),
            KeyButton(text: "-", onPressed: onKeyPressed,),
          ],
        )),
        Expanded(child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            KeyButton(text: "C", onPressed: onKeyPressed,),
            KeyButton(text: "0", onPressed: onKeyPressed,),
            KeyButton(text: ".", onPressed: onKeyPressed,),
            KeyButton(text: "+ =", onPressed: onKeyPressed,),
          ],
        ))
      ],
    );
  }

  Operations _stringToOperations(String txt){
    switch(txt){
      case "/": return Operations.divide;
      case "x": return Operations.multiply;
      case "-": return Operations.substract;
      case "+ =": return Operations.add;
      case ".": return Operations.decimal;
      case "C": return Operations.clear; 
    }
    return null;
  }
}