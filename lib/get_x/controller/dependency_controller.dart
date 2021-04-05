import 'package:get/get.dart';

class DependencyController extends GetxController{


  var count1 = 0.obs;
  var count2 = 0.obs;

  //获取结果
  int get sum =>count1.value + count2.value;

}