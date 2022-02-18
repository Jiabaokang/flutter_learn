
import 'package:flutter/material.dart';

/// author : JiaBaoKang
/// e-mail : jiabaokangsy@gmail.com
/// date   : 2022/2/17 14:47
/// desc   : 在纸张上绘画
///

class Pager extends StatelessWidget {
  const Pager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: CustomPaint(
        painter: PagePainter(),
      ),
    );
  }
}

class PagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..color = Colors.white;

    //绘制线
    canvas.drawLine(Offset(0,0), Offset(100,100), paint);
    
    Path path = Path();
    path.moveTo(100, 100);
    path.lineTo(200, 0);
    canvas.drawPath(path, paint..color = Colors.blueAccent);

  }

  void drawLine(Canvas canvas){}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
