import 'package:flutter/material.dart';
import 'package:skaler/styles/styles.dart';
import 'package:skaler/models/models.dart';

class KeyButton extends StatelessWidget{
  final String text;
  final bool isSelected;
  final void Function(String) onPressed;
  
  KeyButton({Key key, @required this.text, @required this.onPressed, this.isSelected: false}):super(key: key);

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: FlatButton(
        child: Text(text, style: _stringToOperations(text)==Operations.clear?SkalerStyles.lightTextStyle.apply(color: Colors.white):SkalerStyles.lightTextStyle,),
        onPressed: () => onPressed(text),
        color: _getButtonBackgroundColorFromOperation(_stringToOperations(text)),
      )
    );
  }

  Color _getButtonBackgroundColorFromOperation(Operations op){
    if(op == Operations.clear) return SkalerColors.accentColor;
    if(op == Operations.decimal || op == Operations.number) return SkalerColors.primaryLightColor;
    return SkalerColors.primaryColor;
  }

  //REMOVE REDUDANT
  Operations _stringToOperations(String txt){
    switch(txt){
      case "/": return Operations.divide;
      case "x": return Operations.multiply;
      case "-": return Operations.substract;
      case "+ =": return Operations.add;
      case ".": return Operations.decimal;
      case "C": return Operations.clear; 
    }
    return Operations.number;
  }
}