import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:skaler/styles/styles.dart';
import 'package:skaler/utility/utility.dart';
import 'package:skaler/models/models.dart';

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SETTINGS", style: SkalerStyles.defaultTextStyle,),
      ),
      body: Center(
        child: RaisedButton.icon(label: Text("Delete Appdata"), icon: Icon(Icons.delete_forever), onPressed: () {
          Storage.storage.save(SaveData(0, <Scale>[Scale(500)])).then((_)=>SystemChannels.platform.invokeMethod('SystemNavigator.pop'));

        },),
      ),
    );
  }
}