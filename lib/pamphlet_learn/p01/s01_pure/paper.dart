import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  const Paper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: PagePainter(),
      ), //使用CustomPaint绘制
    );
  }
}

class PagePainter extends CustomPainter {
  //创建画笔
  final Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    _paint
      ..color = Colors.black
      ..strokeWidth = 4   //线宽
      ..isAntiAlias = true;

    //绘制yuan
    canvas.drawCircle(Offset(100, 100), 10, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }



}
