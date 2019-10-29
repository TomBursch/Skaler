import 'package:equatable/equatable.dart';
import 'package:skaler/models/models.dart';

abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}

class HomeRefresh extends HomeEvent {}

class HomeSelect extends HomeEvent {
  final int newIndex;

  HomeSelect(this.newIndex);
}

class HomeAdd extends HomeEvent {
  final Scale newScale;

  HomeAdd(this.newScale);
}
class HomeRemove extends HomeEvent {
  final int index;

  HomeRemove(this.index);
}