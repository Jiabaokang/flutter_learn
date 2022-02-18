import 'package:flutter/material.dart';

class GridPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("绘制网格"),),
      body: CustomPaint(
        painter: GridLinePainter(const Size(50,50)),
      ),
    );
  }

}

///画网格线
class GridLinePainter extends CustomPainter {
  Paint _paint =  Paint(); //画笔对象
  Path _path = Path(); //路径对象
  Size _size;//网格区域

  ///构造方法中初始化画笔
  GridLinePainter(this._size) {
    _paint = Paint() //创建画笔对象，使用级联操作符初始化对象属性
      ..color = Colors.redAccent //画笔颜色
      ..style = PaintingStyle.stroke //画线条
      ..isAntiAlias = true; //抗锯齿
  }

  ///实现绘制过程
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(girdPath(20,_size), _paint);
  }

  ///是否应该重新绘制
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  ///绘制网格路劲，step表示网格边长，area为绘制区域
  Path girdPath(double step, Size area) {
    //画横线
    for(int i = 0;i<area.height / step +1;i++){
      _path.moveTo(0, step*i);
      _path.lineTo(area.width, step*i);
    }

    for (int i = 0; i < area.width / step + 1; i++) {//画纵线
      _path.moveTo(step * i, 0);
      _path.lineTo(step * i, area.height);
    }
    return _path;
  }


}
