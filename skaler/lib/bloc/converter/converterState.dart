import 'package:equatable/equatable.dart';
import 'package:skaler/models/models.dart';

class ConverterState extends Equatable {
  final double baseValue;
  final int baseUnit;
  final double scaledValue;
  final int scaledUnit;

  final bool clearOnNextInput;
  final bool isBaseSelected;
  final Operations currentOperation;
  //final Operation left;
  final bool isDecimal;

  ConverterState({
    this.baseValue = 0,
    this.baseUnit = Unit.meters,
    this.scaledValue = 0,
    this.scaledUnit = Unit.meters,
    this.clearOnNextInput = false,
    this.isBaseSelected = true,
    this.currentOperation = Operations.clear,
    this.isDecimal = false,
  }) : super([
          baseValue,
          baseUnit,
          scaledValue,
          scaledUnit,
          clearOnNextInput,
          isBaseSelected,
          currentOperation,
          isDecimal
        ]);

  ConverterState copyFrom(
    ConverterState state, {
    baseValue = 0,
    baseUnit = Unit.meters,
    scaledValue = 0,
    scaledUnit = Unit.meters,
    clearOnNextInput = false,
    isBaseSelected = true,
    currentOperation = Operations.clear,
    isDecimal = false,
  }) {
    return ConverterState();
  }
}
