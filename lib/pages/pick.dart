import 'package:dcydr/bloc/pickpage/bloc.dart';
import 'package:dcydr/bloc/pickpage/event.dart';
import 'package:dcydr/bloc/pickpage/state.dart';
import 'package:dcydr/bloc/router/bloc.dart';
import 'package:dcydr/bloc/router/event.dart';
import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/fade.dart';
import 'package:dcydr/data/types.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_text/gradient_text.dart';

class PickPage extends StatefulWidget {
  final RandomList list;
  PickPage({this.list});
  @override
  _PickPageState createState() => _PickPageState();
}

class _PickPageState extends State<PickPage> {
  PickPageBloc _pageBloc;
  RouterBloc _routerBloc;

  @override
  Widget build(BuildContext context) {
    _pageBloc = BlocProvider.of<PickPageBloc>(context);
    _routerBloc = BlocProvider.of<RouterBloc>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.list.name,
        hasBackButton: true,
        actions: <Widget>[
          IconButton(
            iconSize: 18,
            icon: Icon(
              FlatIcons.settings_5,
            ),
            onPressed: () =>
                _routerBloc.add(MoveToTogglePage(list: widget.list)),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: FadeIn(
              child: InkWell(
                onTap: () => _pageBloc.add(
                  PickItem(items: this.widget.list.items),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: _blocBuilder(context),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _blocBuilder(BuildContext context) =>
      BlocBuilder<PickPageBloc, PickPageState>(
        bloc: _pageBloc,
        builder: (context, state) {
          if (state is PickedItemState) {
            return _buildText(text: state.pick);
          } else if (state is Uninitialized) {
            return _buildText();
          } else {
            return Container();
          }
        },
      );

  Widget _buildText({String text}) => (text == null)
      ? Text(
          'Tap anywhere to pick',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: const Color(0x66000000),
          ),
        )
      : GradientText(text,
          gradient: LinearGradient(
              colors: [const Color(0xff13b6cb), const Color(0xff2a86cb)]),
          style: TextStyle(fontSize: 42),
          textAlign: TextAlign.center);
}
