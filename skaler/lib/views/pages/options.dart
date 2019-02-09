import 'package:flutter/material.dart';

import 'package:skaler/models/models.dart';
import 'package:skaler/views/views.dart';

class Options extends StatefulWidget {
  final int selectedScale;
  final List<Scale> scaleList;

  final void Function(int) selectScale;
  final void Function(int) removeScale;
  final void Function(Scale) addScale;


  Options({Key key, this.selectedScale, this.selectScale, this.scaleList, this.addScale, this.removeScale}) : super(key: key);

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options>{

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 5,right: 5,top: 5),
          child: Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.settings), onPressed: _openSettings,),
              Spacer(),
              IconButton(icon: Icon(Icons.add),onPressed: _addScale,),
            ],
          ),
        ),
        Expanded(child: ListView.builder(
          controller: ScrollController(initialScrollOffset: widget.selectedScale*(MediaQuery.of(context).size.width*0.8 + 20)),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(bottom: 50, top: 20),
          physics: BouncingScrollPhysics(),
          itemCount: widget.scaleList.length+(widget.scaleList.length>0?2:0),
          itemBuilder: (context, index) {
            return (index != 0 && index != widget.scaleList.length+1)?
                        ScaleItem(scale: widget.scaleList[index-1], index: index-1, isSelected: index-1 == widget.selectedScale, selectScale: widget.selectScale, removeScale: widget.removeScale,):
                        Container(constraints: BoxConstraints.expand(width: MediaQuery.of(context).size.width*0.1-10));
          },
        ),),
      ],
    );
  }
  void _addScale(){
    showModalBottomSheet<Scale>(context: context,
    builder: (BuildContext context) {
      return NewScaleSelect();
    }).then((newScale) {
      if(newScale == null) return;
      widget.addScale(newScale);
    });
  }

  void _openSettings(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
  }
}