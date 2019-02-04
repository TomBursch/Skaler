import 'package:flutter/material.dart';

import 'package:skaler/models/models.dart';
import 'views/views.dart';
import 'package:skaler/styles/styles.dart';

class SkalerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skaler',
      theme: SkalerThemes.appTheme,
      home: HomePage(title: 'Skaler'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConversionValue baseValue = ConversionValue();
  ConversionValue scaledValue = ConversionValue();
  bool isBaseSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Expanded(
          flex: 4,
          child: Row(children: <Widget>[
            Expanded(
              child: ValueView(
                id: 0,
                value: baseValue,
                isSelected: isBaseSelected,
                onTap: valueViewSelect,
              ),
            ),
            Expanded(
              child: ValueView(
                id: 1,
                value: scaledValue,
                isSelected: !isBaseSelected,
                onTap: valueViewSelect,
              ),
            )
          ],),
        ),
        Expanded(
          flex: 1,
          child: UnitSelector()
        ),
        Expanded(
          flex: 3,
          child: Keypad(
            onEnter: input,
          )
        )
      ],)
    );
  }

  void input(Operations op, {int value}){
    if(op != null){
      switch(op){
        case Operations.add:
        setState(() {
         _convert(); 
        });
        break;
        case Operations.multiply:
        break;
        case Operations.substract:
        break;
        case Operations.divide:
        break;
        case Operations.decimal:
        break;
        case Operations.clear:
        setState(() {
         _getSelectedValue().value = 0;
         _convert();
        });
        break;
        case Operations.number:
        setState(() {
         _getSelectedValue().shiftAddNumber(value);
         _convert();
        });
        break;
      }
    }
  }

  void valueViewSelect(int id){
    setState(() {
     isBaseSelected = id==0;
     _getSelectedValue().value = 0;
     _convert();
    });
  }

  void _convert(){
    _getNotSelectedValue().convertFrom(_getSelectedValue(), isBaseSelected?1/500:500);
  }

  ConversionValue _getSelectedValue(){
    return isBaseSelected?baseValue:scaledValue;
  }
  ConversionValue _getNotSelectedValue(){
    return !isBaseSelected?baseValue:scaledValue;
  }

}