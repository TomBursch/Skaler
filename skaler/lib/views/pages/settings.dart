import 'package:flutter/material.dart';
import 'package:skaler/styles/styles.dart';

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SETTINGS", style: SkalerStyles.defaultTextStyle,),
      ),
      body: Text("Units: etc..."),
    );
  }
}