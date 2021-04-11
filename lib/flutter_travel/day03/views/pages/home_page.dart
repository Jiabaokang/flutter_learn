import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/flutter_travel/day03/app/cons.dart';
import 'package:flutter_getx_learn/flutter_travel/day03/views/home/home_left_drawer.dart';
import 'package:flutter_getx_learn/flutter_travel/day03/views/home/home_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Cons.homeTabs.length, //标签的个数
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter 联盟"),
          centerTitle: true,
          //打开左边抽屉
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.home),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          actions: <Widget>[Icon(Icons.search), HomeMenu()], //右边的菜单按钮
          bottom: _buildHomeTabBar(),
        ),
        body: Align(
          alignment: Alignment(0,-0.9),
          child: Text("展示集"),
        ),
        drawer: HomeLeftDrawer(),
      ),
    );
  }

  ///构建标签栏
  PreferredSizeWidget _buildHomeTabBar() {
    return TabBar(
        labelColor: Colors.white,
        labelStyle: TextStyle(fontSize: 14),
        unselectedLabelColor: Color(0xffeeeeee),
        tabs: Cons.homeTabs
            .map((tab) => Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(tab),
                ))
            .toList());
  }





}
