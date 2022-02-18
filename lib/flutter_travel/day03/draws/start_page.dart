import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("画N角星"),
        centerTitle: true,
      ),
      body: CustomPaint(
        painter: StartPoint(),
      ),
    );
  }
}

///画多角星
class StartPoint extends CustomPainter {
  Paint _paint = Paint(); //画笔对象
  Path _path = Path(); //路径对象

  StartPoint() {
    //初始化画笔
    _paint
      ..color = Colors.red
      ..isAntiAlias = true;
  }

  ///执行绘制
  @override
  void paint(Canvas canvas, Size size) {
    //移动到坐标系远点
    canvas.translate(-100, 50);
    //使用path绘制五角星
    canvas.drawPath(nStarPath(5, 50, 25), _paint);
    //移动坐标系原点
    canvas.translate(100, 0);
    //使用path绘制8角星
    canvas.drawPath(nStarPath(8, 50, 25), _paint);
    //移动坐标系原点
    canvas.translate(100, 0);
    //使用path绘制12角星
    canvas.drawPath(nStarPath(12, 50, 25, rotate: pi), _paint);
  }

  //是否需要重新配置
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  ///设置路径
  Path nStarPath(int num, double R, double r, {dx = 0, dy = 0, rotate = 0}) {
    //重置路径
    _path.reset();
    //每份的角度
    double perRad = 2 * pi / num;
    double radA = perRad / 2 / 2 + rotate; //A角
    double radB = 2 * pi / (num - 1) / 2 - radA / 2 + radA + rotate; //起始B角
    //移动到起点
    _path.moveTo(cos(radA) * R + dx, -sin(radA) * R + dy);
    for (int i = 0; i < num; i++) {
      //循环生成点，路径连至
      _path.lineTo(
          cos(radA + perRad * i) * R + dx, -sin(radA + perRad * i) * R + dy);
      _path.lineTo(
          cos(radB + perRad * i) * r + dx, -sin(radB + perRad * i) * r + dy);
    }
    _path.close();
    return _path;
  }
}
