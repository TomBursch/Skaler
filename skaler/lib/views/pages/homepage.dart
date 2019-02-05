import 'package:flutter/material.dart';

import 'package:skaler/models/models.dart';
import 'package:skaler/views/views.dart';
import 'package:skaler/styles/styles.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int scale = 500;
  double openPercentage = 0; //in 0-100

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Converter(scale: scale,),
            margin: EdgeInsets.only(top: 80),
          ),
          AnimatedContainer(
            decoration: BoxDecoration(
              color: SkalerColors.primaryColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(openPercentage*0.25)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withAlpha(openPercentage.toInt()+19),
                  blurRadius: 4,
                  spreadRadius: -1,
                  offset: Offset(0, 4)
                )
              ]
            ),
            constraints: BoxConstraints.expand(height: openPercentage*5.20+80),
            padding: EdgeInsets.only(top: 24),
            alignment: Alignment(0, 0),
            duration: Duration(milliseconds: 200),
            curve: Curves.decelerate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: (openPercentage==100.0)?Options():Center(child: Text("1:$scale", style: SkalerStyles.defaultTextStyle,))),
                GestureDetector(
                  onVerticalDragUpdate: _dragUpdate,
                  onVerticalDragEnd: _dragEnd,
                  child: Container(
                    child: RotationTransition(child: Icon(Icons.arrow_drop_down), turns: AlwaysStoppedAnimation(openPercentage/200),),
                    decoration: BoxDecoration(),
                    constraints: BoxConstraints(minWidth: double.infinity),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _dragUpdate(DragUpdateDetails drag){
    setState(() {
      _setHeight(drag.globalPosition.dy);
    });
  }
  void _dragEnd(DragEndDetails drag){
    double vel = drag.velocity.pixelsPerSecond.dy;
    setState(() {
     _setHeight((vel > 40 || (openPercentage*5.20+80 > 250 && vel > -5))?600:80); 
    });
  }
  void _setHeight(double h){
    openPercentage = (h.clamp(80.0, 600.0)-80)/5.20;
  }
}