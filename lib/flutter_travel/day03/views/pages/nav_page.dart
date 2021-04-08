import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/flutter_travel/day03/app/cons.dart';

import 'act_page.dart';
import 'home_page.dart';
import 'love_page.dart';
import 'me_page.dart';
import 'note_page.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  final _controller = PageController();
  var _position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _buildContent(),
        controller: _controller,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _buildBottomItems(),
        currentIndex: _position,
        onTap: (index) {

        },
      ),
    );
  }

  //主体内容页面列表
  List<Widget> _buildContent() => <Widget>[
        HomePage(),
        ActPage(),
        LovePage(),
        NotePage(),
        MePage(),
      ];

  //
  List<BottomNavigationBarItem> _buildBottomItems() {
    return Cons.bottomNavMap.keys
        .map((key) => BottomNavigationBarItem(
            label: key,
            icon: Icon(Cons.bottomNavMap[key]),
            backgroundColor: Colors.blue))
        .toList();
  }
}
