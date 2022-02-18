
import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/flutter_travel/day03/draws/start_page.dart';
import '../../../utils/status_bar_utils.dart';
import 'grid_page.dart';

void main(){
  StatusBarUtils.setStatusBarLight();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              painter: GridLinePainter(Size(500,500)),
            ),
            CustomPaint(
              painter: StartPoint(),
            ),
          ],
        ),
      ),
    );
  }
}