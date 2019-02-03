import 'package:flutter/material.dart';

class KeyButton extends StatelessWidget{
  final String text;
  final bool isSelected;
  final void Function() onPressed;
  
  KeyButton({Key key, @required this.text, @required this.onPressed, this.isSelected = false}):super(key: key);

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: RaisedButton(
        child: Text(text),
        onPressed: onPressed,
      )
    );
  }
}