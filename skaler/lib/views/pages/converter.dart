import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skaler/bloc/converter/bloc.dart';
import 'package:skaler/bloc/home/bloc.dart';

import 'package:skaler/models/models.dart';
import 'package:skaler/views/views.dart';

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  ConverterBloc _bloc;

  ConversionValue baseValue = ConversionValue();
  ConversionValue scaledValue = ConversionValue();
  bool clearOnNextInput = false;
  bool isBaseSelected = true;

  Operations currentOperation = Operations.clear;
  Operation left;
  bool isDecimal = false;

  @override
  void initState() {
    super.initState();
    _bloc = ConverterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<HomeBloc>(context),
      listener: (context, state) {
        baseValue.valueUnit =
            state.getSelectedScale().fromMetric ? Unit.meters : Unit.feet;
        scaledValue.valueUnit =
            state.getSelectedScale().toMetric ? Unit.meters : Unit.feet;
      },
      child: BlocBuilder<HomeEvent, HomeState>(
        bloc: BlocProvider.of<HomeBloc>(context),
        builder: (context, state) => Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Row(
                children: <Widget>[
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
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: UnitSelector(
                selectedUnit: _getSelectedValue().valueUnit,
                availableUnits: (isBaseSelected &&
                            state.getSelectedScale().fromMetric) ||
                        (!isBaseSelected && state.getSelectedScale().toMetric)
                    ? Unit.metricValues
                    : Unit.imperialValues,
                onChanged: unitSelect,
                isBaseSelected: isBaseSelected,
              ),
            ),
            Expanded(
              flex: 4,
              child: Keypad(
                onEnter: input,
                selectedOp: currentOperation,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  void input(Operations op, {int value}) {
    if (op != null) {
      switch (op) {
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
          if (clearOnNextInput)
            setState(() {
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
            if (clearOnNextInput) _getSelectedValue().value = 0;
            _getSelectedValue().shiftAddNumber(value, isDecimal);
            _convert();
          });
          break;
      }
      clearOnNextInput = false;
    }
  }

  void valueViewSelect(int id) {
    setState(() {
      isBaseSelected = id == 0;
      currentOperation = Operations.clear;
      _convert();
    });
    clearOnNextInput = true;
    isDecimal = false;
  }

  void unitSelect(int u) {
    setState(() {
      _getSelectedValue().valueUnit = u;
      _convert();
    });
    clearOnNextInput = true;
  }

  void _convert() {
    /*_getNotSelectedValue().convertFrom(
        _getSelectedValue(),
        isBaseSelected
            ? 1 / state.getSelectedScale().scaler
            : state.getSelectedScale().toDouble());*/
  }

  ConversionValue _getSelectedValue() {
    return isBaseSelected ? baseValue : scaledValue;
  }

  ConversionValue _getNotSelectedValue() {
    return !isBaseSelected ? baseValue : scaledValue;
  }
}
