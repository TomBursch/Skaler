import 'package:bloc/bloc.dart';
import 'package:skaler/utility/utility.dart';
import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  get initialState => HomeInitial();

  SaveData sav;

  HomeBloc() {
    dispatch(HomeRefresh());
  }

  Stream<HomeState> mapEventToState(event) async* {
    if (event is HomeRefresh) {
      sav = await Storage.storage.load();
    }
    if(event is HomeSelect){
      sav.selected = event.newIndex;
    }
    if(event is HomeRemove){
      sav.list.removeAt(event.index);
    }
    if (event is HomeAdd){
      sav.list.add(event.newScale);
    }
    Storage.storage.save(sav);
    yield HomeLoaded(sav.selected, sav.list);
  }
}
