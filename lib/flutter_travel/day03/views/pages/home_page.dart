import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/flutter_travel/day03/app/cons.dart';
import 'package:flutter_getx_learn/flutter_travel/day03/draws/grid_page.dart';
import 'package:flutter_getx_learn/flutter_travel/day03/views/home/home_left_drawer.dart';
import 'package:flutter_getx_learn/flutter_travel/day03/views/home/home_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{


  TabController mController ;

  @override
  void initState() {
    super.initState();
    mController = TabController(
      length: Cons.homeTabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          actions: <Widget>[Icon(Icons.search), HomeMenu()],
          //右边的菜单按钮
          //bottom: _buildHomeTabBar(),
        ),
        // body: Align(
        //   alignment: Alignment(0, -0.9),
        //   child: Text("展示集"),
        // ),
        // body: GridPage(),
        body: Column(
          children: [
            _buildHomeTabBar(),
            _homeContent(),
          ],
        ),
        drawer: HomeLeftDrawer(),
      );

  }

  ///构建标签栏
  PreferredSizeWidget _buildHomeTabBar() {
    return TabBar(
        controller: mController,
        isScrollable: true,
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

  ///创建住界面View
  // Widget _homeContent() {
  //   return TabBarView(
  //       children: Cons.homeTabs
  //           .map((text) => _buildContent(Cons.homeTabs.indexOf(text)))
  //           .toList());
  // }

  //创建主页界面列表
  Widget _homeContent() => TabBarView(
      controller: mController,
      //根据列表创建界面列表
      children: Cons.homeTabs
          .map((text) => _buildContent(Cons.homeTabs.indexOf(text)))
          .toList());

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return GridPage();
      case 1:
        return GridPage();
      case 2:
        return GridPage();
      case 4:
        return GridPage();
    }
  }
}
