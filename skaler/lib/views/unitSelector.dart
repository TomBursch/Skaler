import 'package:flutter/material.dart';

class UnitSelector extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ListWheelScrollView(
      itemExtent: 20,
      useMagnifier: true,
      magnification: 1.2,
      children: <Widget>[
        Text("Kilometer"),
        Text("meter"),
        Text("centimeter"),
        Text("millimeter")
      ],
    );
  }
}