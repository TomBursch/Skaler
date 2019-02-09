import 'package:flutter/material.dart';
import 'package:skaler/models/models.dart';
import 'package:skaler/styles/styles.dart';

class ScaleItem extends StatelessWidget{
  final int index;
  final Scale scale;
  final bool isSelected;

  final void Function(int) selectScale;
  final void Function(int) removeScale;

  ScaleItem({@required this.scale, this.isSelected: false, this.selectScale, this.removeScale, this.index});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => (isSelected)?null:selectScale(index),
      onLongPress: () => removeScale(index),
      child: Container(
        constraints: BoxConstraints.expand(width: MediaQuery.of(context).size.width*0.8),
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected?SkalerColors.accentBackgroundColor:SkalerColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              child: Icon(Icons.home, size: 128,),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text("1:${scale.scaler.toString()}", style: (isSelected?SkalerStyles.highlightTextStyle:SkalerStyles.defaultTextStyle).apply(fontSizeFactor: 2),),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("${scale.fromMetric?"metric":"imperial"} to ${scale.toMetric?"metric":"imperial"}", style: SkalerStyles.lightTextStyle,),
              )
            )
          ],
        ),
      ),
    );
  }
}