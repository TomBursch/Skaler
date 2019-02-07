import 'package:flutter/material.dart';

import 'package:skaler/models/models.dart';
import 'package:skaler/views/views.dart';
import 'package:skaler/styles/styles.dart';
import 'package:skaler/utility/utility.dart';

class HomePage extends StatefulWidget {
  final Storage storage;

  HomePage({Key key, @required this.storage}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedScale = 0;
  List<Scale> scaleList = [Scale(500)];
  double openPercentage = 0; //in 0-100

  @override
  void initState(){
    super.initState();
    widget.storage.load().then((SaveData s) {
      setState(() {
       selectedScale = s.selected;
       scaleList = s.list; 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Converter(scale: _getSelectedScaler(),),
            margin: EdgeInsets.only(top: 80),
          ),
          Visibility(child: GestureDetector(onTap: _toggleOptions), visible: (openPercentage>80),),
          AnimatedContainer(
            decoration: BoxDecoration(
              color: SkalerColors.appbarColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(openPercentage*0.25)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withAlpha(openPercentage.toInt()+15),
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
                Expanded(child: (openPercentage==100.0)?
                              Options(
                                selectedScale: selectedScale,
                                selectScale: selectScale,
                                addScale: addScale,
                                removeScale: removeScale,
                                scaleList: scaleList,
                              ):
                              Center(child: Text("1:${_getSelectedScaler()}", style: SkalerStyles.defaultTextStyle,))),
                GestureDetector(
                  onVerticalDragUpdate: _dragUpdate,
                  onVerticalDragEnd: _dragEnd,
                  onTap: _toggleOptions,
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

  void selectScale(int scl){
    setState(() {
     selectedScale = scl; 
    });
    widget.storage.save(SaveData(selectedScale, scaleList));
  }
  void addScale(Scale s){
    setState(() {
      scaleList.add(s);
    });
    widget.storage.save(SaveData(selectedScale, scaleList));
  }
  void removeScale(int scl){
    setState(() {
      scaleList.removeAt(scl);
      if(scl == selectedScale && selectedScale>0 && selectedScale>=scaleList.length) selectedScale = scaleList.length-1;
    });
    widget.storage.save(SaveData(selectedScale, scaleList));
  }

  int _getSelectedScaler(){
    if(scaleList != null && scaleList.length > 0 && selectedScale >= 0 && selectedScale<scaleList.length && scaleList[selectedScale] != null) return scaleList[selectedScale].scaler;
    return 1;
  }


  void _toggleOptions(){
    setState(() {
     openPercentage = openPercentage==100?0:100;
    });
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