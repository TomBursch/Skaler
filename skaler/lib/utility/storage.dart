import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:skaler/models/models.dart';
import 'package:flutter/material.dart';

class Storage {
  static final Storage storage = Storage._internal();

  factory Storage(){return storage;}
  Storage._internal();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/savedata.txt');
  }

  Future<SaveData> load() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();
      Map<String, dynamic> raw = jsonDecode(contents);

      return SaveData.fromJson(raw);
    } catch (e) {
      // If we encounter an error, return 0
      return SaveData(0, [Scale(500)]);
    }
  }

  Future<File> save(SaveData data) async {
    final file = await _localFile;
  
    // Write the file
    return file.writeAsString(jsonEncode(data));
  }
}

class SaveData{
  int selected = 0;
  List<Scale> list;

  SaveData(this.selected, this.list);

  SaveData.fromJson(Map<String,dynamic> j){
    selected = j["selected"]==null?0:j["selected"] as int;
    _listFromJson(j["list"] as Map<String,dynamic>);
    _fixWrong();
  }

  void _fixWrong(){
    selected = selected.clamp(0, list.length>0?list.length-1:0);
  }

  void _listFromJson(Map<String,dynamic> m){
    list = [];
    for(int i = 0; i < m.length; i++){
      list.add(Scale.fromJson(m["$i"] as Map<String,dynamic>));
    }
  }

  Map<String,dynamic> _listToJson(){
    Map<String,dynamic> m = {};
    for(int i = 0;i<list.length;i++){
      m["$i"] = list[i].toJson();
    }
    return m;
  }

  Map<String,dynamic> toJson() => {
    "selected": selected,
    "list": _listToJson(),
  };

}