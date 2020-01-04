import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/switchtile.dart';
import 'package:dcydr/data/types.dart';
import 'package:flutter/material.dart';

class TogglePage extends StatelessWidget {
  // TODO fix the problem that the disabled
  // ones are still updated in the pick page
  final RandomList list;

  TogglePage({this.list});

  @override
  Widget build(BuildContext context) {
    final Iterable<CustomSwitchTile> tiles = list.items.map(
      (RandomListItem item) => CustomSwitchTile(item),
    );

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Toggle choices',
        hasBackButton: true,
      ),
      body: ListView(children: divided),
    );
  }
}
