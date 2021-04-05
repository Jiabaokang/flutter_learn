import 'package:get/get.dart';

class UpdateController extends GetxController{

  /// 你不需要这个，我推荐使用它只是为了方便语法。
  /// 用静态方法：Controller.to.counter()。
  /// 没有静态方法的情况下：Get.find<Controller>().counter();
  /// 使用这两种语法在性能上没有区别，也没有任何副作用。一个不需要类型，另一个IDE会自动完成。
  static UpdateController get to => Get.find(); // 添加这一行

  int counter = 1;

  void increment(){
    counter ++;
    //update(["text3"]);
    update();
  }

}