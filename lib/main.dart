import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'get_x/controller/count_controller.dart';
import 'get_x/controller/dependency_controller.dart';
import 'get_x/pages/getx_route.dart';
import 'pamphlet_learn/p01/s01_pure/paper.dart';
import 'utils/status_bar_utils.dart';

void main() {
  StatusBarUtils.setStatusBarLight();
  runApp(GetMaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //实例化控制器
    final CountController controller = Get.put(CountController());
    Get.put(DependencyController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter GetX学习'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: Get.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => Get.to(OtherPage(),
                        transition: Transition.cupertino,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 800),
                        arguments: {"keyName": "JIABAOKANG", "keyAge": "18"}),
                    child: const Text('GetX中 Router的使用')),

                ElevatedButton(
                    onPressed: () => testGetXBottomSheet(controller),
                    child: Text('GetX中 内置BottomSheet使用')),

                OutlinedButton(
                    onPressed: () => buildDefaultDialog(controller),
                    child: Text('GetX中 内置Dialog使用')),

                ElevatedButton(
                    onPressed: () => testGetXSnackBar(controller),
                    child: Text('GetX中 内置SnackBar使用')),

                OutlinedButton(
                    onPressed: () => {Get.to(Paper())},
                    child: Text("小册-绘制指南-妙笔生花")),

                OutlinedButton(
                    onPressed: () => {}, child: Text("小册-手势探索-执掌天下")),
                OutlinedButton(
                    onPressed: () => {}, child: Text("小册-动画探索-流光幻影")),
                OutlinedButton(
                    onPressed: () => {}, child: Text("小册-滑动探索-珠联璧合")),

                Divider(
                  height: 30,
                ),
                //GetX更新状态可以根据刷新的范围具体调整（颗粒度的问题）
                Obx(() => Container(
                      color: Colors.amberAccent,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('点击"+"数字累加+1',
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.green)),
                          Obx(() => Text(
                                "小范围更新：${controller.count}",
                                style: TextStyle(
                                    fontSize: 26.0, color: Colors.redAccent),
                              )),
                          Text(
                            "大范围更新：${controller.count}",
                            style: TextStyle(
                                fontSize: 36.0, color: Colors.redAccent),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {controller.increment()},
      ),
    );
  }

  ///测试GetX中内置dialog的使用
  Future testGetXBottomSheet(CountController controller) {
    return Get.bottomSheet(
      Container(
        height: 200,
        color: Colors.white,
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.refresh_outlined,
                size: 30,
                color: Colors.red,
              ),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              title: Text('重启'),
              onTap: () {
                Get.back();
                controller.increment();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.login_outlined,
                size: 30,
                color: Colors.red,
              ),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              title: Text('注销'),
              onTap: () {
                Get.back();
                controller.lessCount();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.offline_bolt,
                size: 30,
                color: Colors.red,
              ),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              title: Text('关机'),
              onTap: () {
                Get.back();
                controller.lessCount();
              },
            ),
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: false,
    );
  }

  ///测试GetX中内置dialog的使用
  Future buildDefaultDialog(CountController controller) {
    return Get.defaultDialog(
      title: '对话框标题',
      titleStyle: TextStyle(color: Colors.red),
      content: Column(
        children: [
          Text("这是测试数据"),
          Text("这是测试数据"),
          Text("这是测试数据"),
          Text("这是测试数据"),
        ],
      ),
      // textCancel: '取消',
      // textConfirm: '确定',
      // cancelTextColor: Colors.lightBlue,
      // confirmTextColor: Colors.white,
      // onCancel: (){
      //
      // },
      // onConfirm: (){
      //   Get.back();
      // }
      cancel: OutlinedButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          "取消",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      confirm: OutlinedButton(
        onPressed: () {
          Get.back();
          testGetXSnackBar(controller);
        },
        child: Text(
          "确定",
          style: TextStyle(color: Colors.lightBlue),
        ),
      ),
      barrierDismissible: false,
      radius: 10.0,
    );
  }

  /// 测试getX中的snackBar
  SnackbarController testGetXSnackBar(CountController controller) {
    return Get.snackbar(
      '这是标题',
      '这是内容',
      backgroundColor: Colors.black45,
      instantInit: false,
      borderColor: Colors.red,
      borderRadius: 5.0,
      borderWidth: 2.0,
      //duration: Duration(milliseconds: 5000),
      mainButton: TextButton(
          onPressed: () => controller.increment(), child: Text('snackBar')),
      isDismissible: false,
      showProgressIndicator: true,
    );
  }

  ///测试GetX中的Dialog

}
