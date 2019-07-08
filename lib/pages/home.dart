import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Choosr/bloc/bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RandomListBloc _randomListBloc;

  @override
  void initState() {
    super.initState();
    _randomListBloc = BlocProvider.of<RandomListBloc>(context);
    _randomListBloc.dispatch(LoadRandomList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Choosr"),
      ),
      body: _buildRandomListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _randomListBloc.dispatch(AddRandomList());
        },
        tooltip: 'Add new list',
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }

  Widget _buildRandomListWidget() {
    return BlocBuilder(
        bloc: _randomListBloc,
        builder: (BuildContext context, RandomListState state) {
          if (state is RandomListLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RandomListLoaded) {
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: state.randomList.length,
              itemBuilder: (context, index) {
                final displayRandomList = state.randomList[index];
                return ListTile(
                  leading: displayRandomList.getIcon(),
                  title: Text(displayRandomList.getName(),
                      style: TextStyle(fontSize: 18.0)),
                );
              },
            );
          }
        });
  }
}
