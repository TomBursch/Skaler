import 'package:flutter/material.dart';
import 'package:skaler/styles/styles.dart';
import 'package:skaler/models/conversionValue.dart';

class ValueView extends StatelessWidget{
  final int id;
  final ConversionValue value;
  final bool isSelected;
  final void Function(int id) onTap;

  ValueView({@required this.id, @required this.value, this.isSelected: false, @required this.onTap});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => onTap(id),
      child: Stack(
        children: <Widget>[
          Container(
            child: Center(
              child: Text(_getValueString(), style: _getStyle()),
            ),
            decoration: BoxDecoration(
              color: SkalerColors.primaryColor,
              borderRadius: BorderRadius.circular(50.0)
            ),
            constraints: BoxConstraints.expand(),
            margin: EdgeInsets.all(15),
          ),
          Container(
            child: Center(child: Text((value==null)?"null":value.valueUnit.toString().split('.')[1], style: SkalerStyles.defaultTextStyle.apply(fontSizeFactor: 0.7))),
            decoration: BoxDecoration(
              color: SkalerColors.primaryLightColor,
              borderRadius: BorderRadius.circular(50.0)
            ),
            constraints: BoxConstraints.expand(height: 25),
            margin: EdgeInsets.fromLTRB(15, 10, 35, 0),
          ),
        ],
      )
    );
  }
  String _getValueString(){
    if(value==null) return "error";
    if(value.value%1>0) return value.value.toString();
    return value.value.toInt().toString();
  }
  TextStyle _getStyle(){
    return isSelected?SkalerStyles.highlightTextStyle:SkalerStyles.defaultTextStyle;
  }
}