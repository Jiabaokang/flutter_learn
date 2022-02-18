import 'package:flutter/material.dart';

/// author : JiaBaoKang
/// e-mail : jiabaokangsy@gmail.com
/// date   : 2022/2/17 16:02
/// desc   : 在纸上画图
class Paper extends StatelessWidget {
  const Paper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: CustomPaper(),
      ),
    );
  }
}

class CustomPaper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawStrokeCap(canvas);
    drawStrokeJoin(canvas);
  }

  // 测试 strokeCap 属性
  void drawStrokeCap(Canvas canvas) {
    int dev = 30;
    Paint paint = Paint()
      ..strokeWidth = 20
      ..color = Colors.deepOrange;

    canvas.drawLine(
        Offset(50, 50), Offset(50, 150), paint..strokeCap = StrokeCap.butt);
    canvas.drawLine(
        Offset(dev + 50, 50), Offset(dev + 50, 150), paint..strokeCap = StrokeCap.round);
    canvas.drawLine(
        Offset(dev+80, 50), Offset(dev+80, 150), paint..strokeCap = StrokeCap.square);

    // 测试线
    canvas.drawLine(
        Offset(0, 50),
        Offset(1600, 50),
        paint
          ..strokeWidth = 1
          ..color = Colors.cyanAccent);
    canvas.drawLine(
        Offset(0, 150),
        Offset(1600, 150),
        paint
          ..strokeWidth = 1
          ..color = Colors.cyanAccent);
  }


  // 测试 strokeJoin 属性
  void drawStrokeJoin(Canvas canvas){
    final xValue = 100.0;
    final yValue = 250.0;

    //画笔
    Paint paint = Paint()
        ..color = Colors.blue
        ..strokeWidth = 20
        ..style = PaintingStyle.stroke;

    //路径
    Path path = Path();
    path.moveTo(100, 150);
    path.lineTo(xValue, yValue);
    // path.relativeLineTo(100, -50);
    // path.relativeLineTo(0, 100);
    canvas.drawPath(path, paint..strokeJoin = StrokeJoin.bevel);




  }


  // 测试 strokeMiterLimit 属性

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
