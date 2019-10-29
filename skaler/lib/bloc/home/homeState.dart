import 'package:equatable/equatable.dart';
import 'package:skaler/models/models.dart';

abstract class HomeState extends Equatable {
  int selectedScale;
  List<Scale> scaleList;
  HomeState(this.selectedScale, this.scaleList, [List props = const []])
      : super(props);
  Scale getSelectedScale() => scaleList[selectedScale];
}

class HomeInitial extends HomeState {
  HomeInitial() : super(0, [Scale(500)]);

  @override
  String toString() => 'HomeInitial';
}

class HomeLoaded extends HomeState {
  HomeLoaded(int index, List<Scale> scaleList)
      : super(index, scaleList, scaleList.cast<dynamic>() + [index]);

  @override
  String toString() => 'HomeLoaded';
}
