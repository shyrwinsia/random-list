import 'package:dcydr/components/customswitch.dart';
import 'package:dcydr/components/fade.dart';
import 'package:dcydr/data/dao.dart';
import 'package:dcydr/data/types.dart';
import 'package:flutter/material.dart';

class CustomSwitchTile extends StatefulWidget {
  final RandomListItem item;
  final RandomList list;
  final ValueChanged<bool> onChanged;

  CustomSwitchTile({
    this.list,
    this.item,
    this.onChanged,
  });

  @override
  _CustomSwitchTileState createState() => _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  @override
  Widget build(BuildContext context) => ListTile(
        title: widget.item.selected
            ? FadeIn(
                child: Text(widget.item.name),
                fromAlpha: 0.4,
                toAlpha: 1.0,
              )
            : FadeOut(
                child: Text(widget.item.name),
                fromAlpha: 1.0,
                toAlpha: 0.4,
              ),
        trailing: CustomSwitch(
          value: this.widget.item.selected,
          onChanged: (value) => _update(value),
        ),
        onTap: () => _update(!this.widget.item.selected),
      );

  void _update(bool value) {
    setState(() => widget.item.selected = value);
    RandomListDao().update(widget.list);
  }
}
