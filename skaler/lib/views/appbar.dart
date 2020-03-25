import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/bloc.dart';
import '../styles/styles.dart';

class SAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeEvent, HomeState>(
      bloc: BlocProvider.of<HomeBloc>(context),
      builder: (context, state) => Column(
        children: [
          Spacer(),
          Text(
            "1:${state.scaleList[state.selectedScale].scaler}",
            style: SkalerStyles.defaultTextStyle,
          ),
          SizedBox(
            height: 12.0,
          ),
          Center(
            child: Container(
              width: 70,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
        ],
      ),
    );
  }
}
