import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skaler/bloc/home/bloc.dart';

import 'package:skaler/models/models.dart';
import 'package:skaler/views/views.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeEvent, HomeState>(
      bloc: BlocProvider.of<HomeBloc>(context),
      builder: (context, state) => Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5, right: 5, top: 20),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: _openSettings,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addScale,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: ScrollController(
                  initialScrollOffset: state.selectedScale *
                      (MediaQuery.of(context).size.width * 0.8 + 20)),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(bottom: 0, top: 12),
              physics: BouncingScrollPhysics(),
              itemCount: state.scaleList.length +
                  (state.scaleList.length > 0 ? 2 : 0),
              itemBuilder: (context, index) {
                return (index != 0 && index != state.scaleList.length + 1)
                    ? ScaleItem(
                        scale: state.scaleList[index - 1],
                        index: index - 1,
                        isSelected: index - 1 == state.selectedScale,
                        selectScale: (i) => BlocProvider.of<HomeBloc>(context).dispatch(HomeSelect(i)),
                        removeScale: (i) => BlocProvider.of<HomeBloc>(context).dispatch(HomeRemove(i)),
                      )
                    : Container(
                        constraints: BoxConstraints.expand(
                            width:
                                MediaQuery.of(context).size.width * 0.1 - 10));
              },
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 70,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
        ],
      ),
    );
  }

  void _addScale() {
    showModalBottomSheet<Scale>(
        context: context,
        builder: (BuildContext context) {
          return NewScaleSelect();
        }).then((newScale) {
      if (newScale == null) return;
      BlocProvider.of<HomeBloc>(context).dispatch(HomeAdd(newScale));
    });
  }

  void _openSettings() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
  }
}
