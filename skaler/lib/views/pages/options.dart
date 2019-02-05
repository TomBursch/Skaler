import 'package:flutter/material.dart';

import 'package:skaler/models/models.dart';
import 'package:skaler/views/views.dart';
import 'package:skaler/styles/styles.dart';

class Options extends StatefulWidget {

  Options({Key key}) : super(key: key);

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options>{

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.settings), onPressed: _openSettings,),
            Spacer(),
            IconButton(icon: Icon(Icons.add),onPressed: null,),
          ],
        ),

      ],
    );
  }

  void _openSettings(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
  }
}