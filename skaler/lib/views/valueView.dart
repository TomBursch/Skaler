import 'package:flutter/material.dart';
import 'package:skaler/style/styles.dart';

class ValueView extends StatelessWidget{
  final double value;
  final bool isSelected;

  ValueView({this.value = 0, this.isSelected = false});

  @override
  Widget build(BuildContext context){
    return Container(
      child: Text(value.toString(), style: _getStyle()),
      decoration: BoxDecoration(
        color: Color.fromRGBO(200, 200, 200, 1),
        borderRadius: BorderRadius.circular(50.0))
      ),
    );
  }

  TextStyle _getStyle(){
    return isSelected?getHighlightTextStyle():getDefaultTextStyle();
  }
}