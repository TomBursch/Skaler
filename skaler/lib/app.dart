import 'package:flutter/material.dart';

import 'views/views.dart';
import 'package:skaler/styles/styles.dart';

class SkalerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skaler',
      theme: SkalerThemes.appTheme,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}