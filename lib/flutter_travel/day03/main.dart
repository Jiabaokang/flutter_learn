
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/status_bar_utils.dart';
import 'views/pages/nav_page.dart';

void main(){
  StatusBarUtils.setStatusBarLight();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: NavPage(),
    );
  }
}
