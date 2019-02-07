import 'package:flutter/material.dart';

import 'views/views.dart';
import 'package:skaler/styles/styles.dart';
import 'package:skaler/utility/utility.dart';

class SkalerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skaler',
      theme: SkalerThemes.appTheme,
      home: HomePage(storage: Storage()),
      debugShowCheckedModeBanner: false,
    );
  }
}