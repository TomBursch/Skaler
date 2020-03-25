import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skaler/bloc/home/bloc.dart';
import 'package:skaler/models/models.dart';
import 'package:skaler/views/appbar.dart';
import 'package:skaler/views/views.dart';
import 'package:skaler/styles/styles.dart';
import 'package:skaler/utility/utility.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  final Storage storage;

  HomePage({Key key, @required this.storage}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PanelController _controller = PanelController();
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = HomeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        bloc: _bloc,
        child: SlidingUpPanel(
          controller: _controller,
          slideDirection: SlideDirection.DOWN,
          minHeight: 80,
          maxHeight: 600,
          body: Container(
            child: Converter(),
            margin: EdgeInsets.only(top: 80),
          ),
          panel: Options(),
          collapsedReplaces: true,
          collapsed: SAppBar(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
