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
    drawIsAntiAliasColor(canvas);
    drawStyleStrokeWidth(canvas);
  }

  // 测试 isAntiAlias 和 color属性
  void drawIsAntiAliasColor(Canvas canvas) {
    Paint paint = Paint();

    canvas.drawCircle(
        Offset(50, 180),
        50,
        paint
          ..color = Colors.blue
          ..isAntiAlias = true);

    canvas.drawCircle(
        Offset(180.0, 180),
        50,
        paint
          ..color = Colors.red
          ..isAntiAlias = false);
  }

  // 测试 style 和 strokeWidth 属性
  void drawStyleStrokeWidth(Canvas canvas) {
    Paint paint = Paint();
    canvas.drawCircle(
        Offset(320, 180),
        50,
        paint
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 20
          ..isAntiAlias = true);

    canvas.drawCircle(
        Offset(450, 180),
        50,
        paint
          ..color = Colors.black
          ..style = PaintingStyle.fill
          ..strokeWidth = 20
          ..isAntiAlias = true);

    canvas.drawCircle(
        Offset(450, 180),
        50,
        paint
          ..color = Colors.black
          ..style = PaintingStyle.fill
          ..strokeWidth = 20
          ..isAntiAlias = true);

    //测试strokeWidth
    canvas.drawLine(
        Offset(0, 250),
        Offset(3600, 250),
        paint
          ..strokeWidth = 2
          ..color = Colors.deepOrange);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
