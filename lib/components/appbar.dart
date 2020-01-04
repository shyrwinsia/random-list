import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final bool hasBackButton;

  CustomAppBar({
    @required this.title,
    this.actions,
    this.hasBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    // final _routerBloc = BlocProvider.of<RouterBloc>(context);
    return GradientAppBar(
      backgroundColorStart: const Color(0xff13b6cb),
      backgroundColorEnd: const Color(0xff2a86cb),
      centerTitle: true,
      title: Text(title),
      leading: hasBackButton
          ? IconButton(
              iconSize: 18,
              icon: Icon(
                FlatIcons.con_left_arrow_1_a,
              ),
              onPressed: () {
                // BlocProvider.of<RouterBloc>(context).add(PopPage());
              },
            )
          : null,
      elevation: 0,
      actions: this.actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
