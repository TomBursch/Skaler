import 'package:flutter/material.dart';

import 'views/views.dart';
import 'package:skaler/styles/styles.dart';
import 'package:skaler/utility/utility.dart';

class SkalerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skaler',
      theme: SkalerThemes.appTheme,
      home: HomePage(storage: Storage.storage),
      debugShowCheckedModeBanner: false,
    );
  }
}