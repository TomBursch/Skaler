import 'package:flutter/material.dart';
import 'views/views.dart';

class SkalerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skaler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  double baseValue;
  double scaledValue;
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
                value: baseValue,
                isSelected: isBaseSelected,
              ),
            ),
            Expanded(
              child: ValueView(
                value: scaledValue,
                isSelected: !isBaseSelected,
              ),
            )
          ],),
        ),
        Expanded(
          flex: 1,
          child: UnitSelector()
        ),
        Keypad()
      ],)
    );
  }
}