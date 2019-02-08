import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skaler/models/models.dart';
import 'package:skaler/styles/styles.dart';

class UnitSelector extends StatefulWidget{
  final int selectedUnit;
  final List<int> availableUnits;
  final bool isBaseSelected;
  final void Function(int unit) onChanged;

  UnitSelector({Key key, this.selectedUnit: Unit.meters, this.onChanged, this.availableUnits: Unit.metricValues, this.isBaseSelected}):super(key: key);

  _UnitSelectorState createState() => _UnitSelectorState();

}

class _UnitSelectorState extends State<UnitSelector>{
  FixedExtentScrollController scrollController;
  bool switchedView = false;

  @override
  void initState(){
    super.initState();
    scrollController = FixedExtentScrollController(initialItem: widget.availableUnits.indexOf(widget.selectedUnit));
  }

  @override
  void didUpdateWidget(UnitSelector oldWidget){
    super.didUpdateWidget(oldWidget);
    if(oldWidget.isBaseSelected != widget.isBaseSelected){
      switchedView = true;
      _animateTo(widget.availableUnits.indexOf(widget.selectedUnit)).then((void v) => switchedView = false);
    }
  }

  @override
  Widget build(BuildContext context){
    return Stack(
      children: <Widget>[
        Center(child: Container(
          decoration: const BoxDecoration(
            color: SkalerColors.primaryLightColor,
            border: Border(
              top: BorderSide(color: SkalerColors.primaryColor, width: .6),
              bottom: BorderSide(color: SkalerColors.primaryColor, width: .6)
            )
          ),
          constraints: const BoxConstraints(maxHeight: 20),
        )),
        NotificationListener(
          onNotification: _onNotification,
          child: ListWheelScrollView(
            itemExtent: 20,
            physics: BouncingScrollPhysics(),
            diameterRatio: 1.5,
            children: _buildChildren(),
            controller: scrollController,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildChildren(){
    List<Widget> l = [];
    for (int u in widget.availableUnits) {
      l.add(Center(child: Text(
        Unit.getString(u).toUpperCase(),
        style: widget.selectedUnit == u?SkalerStyles.lightTextStyle.apply(color: SkalerColors.accentColor, fontSizeFactor: .6):SkalerStyles.lightTextStyle.apply(fontSizeFactor: .6),
      )));
    }
    return l;
  }

  bool _onNotification(Notification notification){
    if (!switchedView && notification is ScrollNotification) {
      int index = (notification.metrics.pixels + 10) ~/ 20;

      if(index >= 0 && index < widget.availableUnits.length && widget.availableUnits[index] != widget.selectedUnit){
        widget.onChanged(widget.availableUnits[index]);
      }
      if(notification is UserScrollNotification && index >= 0 && index < widget.availableUnits.length && notification.direction.index == 0){
        _animateTo(index);
      }
      
    }
    return true;
  }

  Future<void> _animateTo(int index, {int durationMillis: 200}) async {
    await scrollController.animateTo(index*20.0, duration: new Duration(milliseconds: durationMillis), curve: Curves.decelerate);
  }
}