import 'package:get/get.dart';

class CountController extends GetxController {
  //定义变量；
  var count = 0.obs;

  //方法触发变量技术增加；
  increment() => count++;

  //减数
  lessCount() {
    count--;
  }

  var count1 = 0.obs;
  var count2 = 0.obs;

  //获取结果
  int get sum =>count1.value + count2.value;

}
