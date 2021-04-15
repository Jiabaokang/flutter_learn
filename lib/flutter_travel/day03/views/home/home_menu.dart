import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/flutter_travel/day03/app/cons.dart';
import 'package:flutter_getx_learn/flutter_travel/day03/views/dialogs/dialog_about.dart';

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: _buildItemBuilder,
      onSelected: (index) {
        _onSelected(context, index);
      },
    );
  }

  List<PopupMenuEntry<int>> _buildItemBuilder(context) => Cons.menuInfo
      .map((e) => PopupMenuItem(
            child: Text(e),
            value: Cons.menuInfo.indexOf(e),
          ))
      .toList();

  void _onSelected(BuildContext context, index) {
    print(index);
    switch (index) {
      case 0:
        showDialog(
            context: context,
            builder: (context) => DialogAbout());
        break;
    }
  }
}
