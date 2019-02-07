import 'package:flutter/material.dart';

import 'package:skaler/models/models.dart';
import 'package:skaler/views/views.dart';

class Converter extends StatefulWidget {
  final int scale;
  Converter({Key key, this.scale: 500}) : super(key: key);

  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  ConversionValue baseValue = ConversionValue();
  ConversionValue scaledValue = ConversionValue();
  bool clearOnNextInput = false;
  bool isBaseSelected = true;

  Operations currentOperation = Operations.clear;
  Operation left;
  bool isDecimal = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        flex: 4,
        child: Row(children: <Widget>[
          Expanded(
            child: ValueView(
              id: 0,
              value: baseValue,
              isSelected: isBaseSelected,
              onTap: valueViewSelect,
            ),
          ),
          Expanded(
            child: ValueView(
              id: 1,
              value: scaledValue,
              isSelected: !isBaseSelected,
              onTap: valueViewSelect,
            ),
          )
        ],),
      ),
      Expanded(
        flex: 1,
        child: UnitSelector(
          selectedUnit: _getSelectedValue().valueUnit,
          availableUnits: Unit.values,
          onChanged: unitSelect,
        )
      ),
      Expanded(
        flex: 3,
        child: Keypad(
          onEnter: input,
          selectedOp: currentOperation,
        )
      )
    ],);
  }

  void input(Operations op, {int value}){
    if(op != null){
      switch(op){
        case Operations.add:
        setState(() {
         _convert(); 
        });
        break;
        case Operations.multiply:
        break;
        case Operations.substract:
        break;
        case Operations.divide:
        break;
        case Operations.decimal:
          if(clearOnNextInput) setState(() {
           _getSelectedValue().value = 0; 
          });
          isDecimal = true;
        break;
        case Operations.clear:
        setState(() {
         _getSelectedValue().value = 0;
         _convert();
        });
        isDecimal = false;
        break;
        case Operations.number:
        setState(() {
         if(clearOnNextInput) _getSelectedValue().value = 0;
         _getSelectedValue().shiftAddNumber(value, isDecimal);
         _convert();
        });
        break;
      }
      clearOnNextInput = false;
    }
  }

  void valueViewSelect(int id){
    setState(() {
     isBaseSelected = id==0;
     currentOperation = Operations.clear;
     _convert();
    });
    clearOnNextInput = true;
    isDecimal = false;
  }

  void unitSelect(Unit u){
    setState(() {
     _getSelectedValue().valueUnit = u;
     _convert();
    });
    clearOnNextInput = true;
  }

  void _convert(){
    _getNotSelectedValue().convertFrom(_getSelectedValue(), isBaseSelected?1/widget.scale:widget.scale.toDouble());
  }

  ConversionValue _getSelectedValue(){
    return isBaseSelected?baseValue:scaledValue;
  }
  ConversionValue _getNotSelectedValue(){
    return !isBaseSelected?baseValue:scaledValue;
  }
}