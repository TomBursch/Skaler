import 'package:flutter/material.dart';
import 'package:skaler/styles/styles.dart';
import 'package:skaler/models/models.dart';

class NewScaleSelect extends StatefulWidget{
  @override
  _NewScaleSelectState createState() => _NewScaleSelectState();
}

class _NewScaleSelectState extends State<NewScaleSelect>{
  int value = 500;
  bool fromMetric = true;
  bool toMetric = true;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("1:$value"),
        Slider(
          value: value.toDouble(),
          min: 1,
          max: 1000,
          onChanged: _onValueChanged,
          activeColor: SkalerColors.accentColor,
        ),
        SwitchListTile(
          title: Text("Convert from imperial"),
          value: !fromMetric,
          onChanged: (s) => setState(() {
            fromMetric = !s;
          }),
        ),
        SwitchListTile(
          title: Text("Convert to imperial"),
          value: !toMetric,
          onChanged: (s) => setState(() {
            toMetric = !s;
          }),
        ),
        RaisedButton(
          onPressed: () => Navigator.pop(context, Scale(value, fromMetric: fromMetric, toMetric: toMetric)),
          child: Text("OK"),
        )
      ],
    );
  }

  void _onValueChanged(double v){
    int factor = (v>200)?100:(v>100)?50:(v>50)?5:1;
    setState(() {
      value = ((v/factor).round()*factor).clamp(1, 1000);
    });
  }
}