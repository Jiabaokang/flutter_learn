import 'dart:math';

///dart语言中的接口定义关键字是：abstract 关键字

///这是一个接口定义,定义了对象的行为
abstract class Operable {
  void reflex(); //反向
  void reflexX(); //X反向
  void reflexY(); //Y反向
  void scale(num xRate, num yRate); //缩放
  void translate(num dx, num dy); //平移
  void rotate(num deg, [isAnticlockwise = true]); //旋转
}

///实现接口定义的行为方法
class Vector2 extends Operable {
  //成员变量
  num x = 0;
  num y = 0;

  //构造方法
  Vector2(this.x, this.y);

  //映射对象
  Vector2.formMap(Map<String, num> point) {
      x = point['x']??0;
      y = point['y']??0;
  }


  @override
  String toString() {
    return '{x: $x, y: $y}';
  }

  double get distance => sqrt(x * x + y * y);//模
  double get rad=>atan2(y,x);//弧度
  double get angle=>rad*180/pi;//角度

  //+重载
  Vector2 operator +(Vector2 other) => Vector2(x + other.x, y + other.y);
  Vector2 operator -(Vector2 other) => //-重载
  Vector2(x - other.x, y - other.y);
  num operator *(Vector2 other) =>//*重载
  x * other.x + y * other.y;

  @override
  void reflex() {
    this.x=-x; this.y=-y;
  }
  @override
  void reflexX() {   this.x=-x; }
  @override
  void reflexY() {  this.y=-y;  }
  @override
  void rotate(num deg,
      [isAnticlockwise = true]) {
    var curRad = rad + deg*pi/180;
    this.x=distance*cos(curRad);
    this.y=distance*sin(curRad);
  }
  @override
  void scale(num xRate, num yRate) {
    this.x *=xRate;  this.y *=yRate;
  }
  @override
  void translate(num dx, num dy) {
    this.x +=dx; this.y +=dy; }
}
