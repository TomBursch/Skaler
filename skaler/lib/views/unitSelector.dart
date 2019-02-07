import 'package:flutter/material.dart';
import 'package:skaler/models/models.dart';
import 'package:skaler/styles/styles.dart';

class UnitSelector extends StatelessWidget{
  final Unit selectedUnit;
  final List<Unit> availableUnits;
  final void Function(Unit op) onChanged;
  final FixedExtentScrollController scrollController;

  UnitSelector({Key key, this.selectedUnit: Unit.meters, this.onChanged, this.availableUnits: Unit.values}):scrollController = FixedExtentScrollController(initialItem: selectedUnit.index),super(key: key);

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
    for (Unit u in availableUnits) {
      l.add(Text(
        u.toString().split('.')[1].toUpperCase(),
        style: selectedUnit == u?SkalerStyles.lightTextStyle.apply(color: SkalerColors.accentColor, fontSizeFactor: .6):SkalerStyles.lightTextStyle.apply(fontSizeFactor: .6),
      ));
    }
    return l;
  }

  bool _onNotification(Notification notification){
    if (notification is ScrollNotification) {
      int index = (notification.metrics.pixels + 10) ~/ 20;

      if(index >= 0 && index < Unit.values.length && index != selectedUnit.index){
        onChanged(Unit.values[index]);
      }
      if(notification is UserScrollNotification && index >= 0 && index < Unit.values.length && notification.direction.index == 0){
        _animateTo(selectedUnit.index);
      }
      
    }
    return true;
  }

  void _animateTo(int index, {int durationMillis: 200}) {
    scrollController.animateTo(index*20.0, duration: new Duration(milliseconds: durationMillis), curve: Curves.decelerate);
  }
}