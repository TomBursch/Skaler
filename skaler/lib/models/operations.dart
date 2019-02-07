import 'package:flutter/material.dart';

enum Operations {
  add,
  substract,
  multiply,
  divide,
  clear,
  decimal,
  number
}

class Operation {
  final Operations operation;
  final double number;
  Operation left;
  Operation right;

  Operation({@required this.operation, this.left, this.right, this.number});

  double evaluate(){
    switch(operation){
      case Operations.add: return left.evaluate() + right.evaluate();
      break;
      case Operations.multiply: left.evaluate() * right.evaluate();
      break;
      case Operations.substract: left.evaluate() - right.evaluate();
      break;
      case Operations.divide: return left.evaluate()/right.evaluate();
      break;
      case Operations.number: return number;
      break;
      case Operations.decimal: break;
      case Operations.clear: break;
    }
    return 0;
  }
}