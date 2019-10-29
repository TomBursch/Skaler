import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark));
  runApp(SkalerApp());
}