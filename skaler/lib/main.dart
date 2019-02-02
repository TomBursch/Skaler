import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skaler',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BasePage(title: 'Skalar'),
    );
  }
}

class BasePage extends StatelessWidget {
  BasePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(children: <Widget>[
        Expanded(
          flex: 4,
          child: Result(),
        ),
        Expanded(
          flex: 1,
          child: ListWheelScrollView(
            itemExtent: 20,
            useMagnifier: true,
            magnification: 1.2,
            children: <Widget>[
              Text("Kilometer"),
              Text("meter"),
              Text("centimeter"),
              Text("millimeter")
            ],
          )),
        NumPad()
      ],)
    );
  }
}

class NumPad extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Column( children: <Widget>[
      Row(children: <Widget>[
        calcButton("7", () => {}),
        calcButton("8", () => {}),
        calcButton("9", () => {}),
        calcButton("/", () => {})
      ],),
      Row(children: <Widget>[
        calcButton("4", () => {}),
        calcButton("5", () => {}),
        calcButton("6", () => {}),
        calcButton("x", () => {})
      ],),
      Row(children: <Widget>[
        calcButton("1", () => {}),
        calcButton("2", () => {}),
        calcButton("3", () => {}),
        calcButton("-", () => {})
      ],),
      Row(children: <Widget>[
        calcButton("C", () => {}),
        calcButton("0", () => {}),
        calcButton(".", () => {}),
        calcButton("+", () => {})
      ],),
    ],);
  }

  Widget calcButton(String text, void onPressed()){
    return Expanded(
      child: RaisedButton(child: Text(text), onPressed: onPressed,),
    );
  }
}

class Result extends StatefulWidget{
  double _base = 0;
  double _scaled = 0;
  bool _isBaseSelected = true;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result>{

  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        Expanded(child: Center(child: GestureDetector(onTap: _onBaseTap, child:
          Text(widget._base.toString(), style: _getTextStyle(true))))),
        Expanded(child: Center(child: GestureDetector(onTap: _onScaledTap, child:
          Text(widget._scaled.toString(), style: _getTextStyle(false))))),
      ],
    );
  }

  void _onBaseTap(){
    setState(() {
     widget._isBaseSelected = true; 
    });
  }
  void _onScaledTap(){
    setState(() {
     widget._isBaseSelected = false; 
    });
  }

  TextStyle _getTextStyle(bool isBase){
    return (isBase == widget._isBaseSelected)?_getHighlightTextStyle():_getDefaultTextStyle();
  }
  TextStyle _getDefaultTextStyle() {
    return new TextStyle(
      color: Color.fromRGBO(196, 197, 203, 1.0),
      fontSize: 14.0,
    );
  }
  TextStyle _getHighlightTextStyle() {
    return new TextStyle(
      color: Color.fromRGBO(77, 123, 243, 1.0),
      fontSize: 28.0,
    );
  }
}