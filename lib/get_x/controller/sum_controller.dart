import 'package:get/get.dart';

///继承extends GetxController的目的：
///1、现实依赖注入：final SumController _controller = Get.put(SumController());
///2、销毁Controller,释放资源'；
///3、分离业务带和UI代码；
class SumController extends GetxController{

  var count1 = 0.obs;
  var count2 = 0.obs;

  //获取结果
  int get sum =>count1.value + count2.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //以下内容的介绍可以产考GetX-Workers：https://github.com/jonataslaw/getx/blob/master/documentation/zh_CN/state_management.md

    ever(count1, (callBack){
      //可以计算购物车价格；count就是数据
      print("监听：$callBack");
    });

    //变量第一次赋值的时候调用；例如处理用户登录信息
    //user == null
    ever(count2, (callBack){
      //可以计算购物车价格；count就是数据
      print("监听2：$callBack");
    });

    //防止重复点击 反复赋值（防抖动），比如搜索，输入框中监听，多久执行一次输入回调
    debounce(count2, (callback){
      print("等待一定时间后输出结果：$callback");
    },time: Duration(seconds: 3));

    //匀速延时输出
    interval(count1, (callback){
      print("匀速延时输出：$callback");
    },time: Duration(seconds: 2));

  }

  ///释放资源
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}