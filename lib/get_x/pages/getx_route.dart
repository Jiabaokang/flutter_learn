import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/get_x/pages/html_demo_page.dart';
import 'package:flutter_getx_learn/get_x/controller/sum_controller.dart';
import 'package:flutter_getx_learn/get_x/controller/update_controller.dart';
import 'package:flutter_getx_learn/get_x/model/user_data.dart';
import 'package:flutter_getx_learn/utils/color_utils.dart';
import 'package:flutter_getx_learn/utils/status_bar_utils.dart';
import 'package:get/get.dart';

import 'getx_dependency_page.dart';

class OtherPage extends StatelessWidget {
  // final CountController _controller;
  //
  // OtherPage(this._controller);

  @override
  Widget build(BuildContext context) {
    //StatusBarUtils.setStatusBarDark();
    final SumController _controller = Get.put(SumController());
    //final UpdateController _updateController = Get.put(UpdateController());
    final String name = Get.arguments['keyName'];
    final user1 = UserData(name: "JiaBaoKang", age: 0).obs;
    final user2 = UserData(name: "Kobe", age: 21).obs;

    return Scaffold(
      appBar: AppBar(
        title: Text('GetX 中状态管理、路由管理'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("这是上个界面通过路由key:value传递的数据:$name"),
            Obx(() => Text(
                  "显示更新的结果:姓名=${user1.value.name},年龄=${user1.value.age}",
                  style: TextStyle(fontSize: 22, color: ColorsUtils.randomColor()),
                )),
            ElevatedButton(
                onPressed: () {
                  user1.update((user) {
                    user.name = "SY";
                    user.age = 23;
                  });
                },
                child: Text("更新User对象后,Text会显示结果")),
            Obx(
              () => Text(
                "Obx方式更新UI:${_controller.sum}",
                style: TextStyle(fontSize: 32, color: ColorsUtils.randomColor()),
              ),
            ),
            GetX<SumController>(
              builder: (_controller) {
                return Text('${_controller.count1.value}',
                    style: TextStyle(fontSize: 22,color: ColorsUtils.randomColor()));
              },
            ),
            GetX<SumController>(
              builder: (_controller) {
                return Text(
                  '${_controller.count2.value}',
                  style: TextStyle(fontSize: 22,color: ColorsUtils.randomColor()),
                );
              },
            ),
            GetX<SumController>(
              builder: (_controller) {
                return Text('GetX方式更新UI:${_controller.sum}',
                    style: TextStyle(fontSize: 32, color: ColorsUtils.randomColor()));
              },
            ),
            ElevatedButton(
                onPressed: () {
                  _controller.count1++;
                },
                child: Text("点击计数器1")),
            ElevatedButton(
                onPressed: () {
                  _controller.count2++;
                },
                child: Text("点击计数器2")),

            Padding(
              padding: const EdgeInsets.only(left:30,top:8,right:16,bottom: 30),
              child: Container(
                height: 120,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: RadialGradient(
                    center: Alignment.lerp(Alignment.bottomLeft, Alignment.topLeft, 0.5),
                    radius: 2,
                    colors: <Color>[
                      ColorsUtils.randomColor(limitG: 0),
                      ColorsUtils.randomColor(),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          //static UpdateController get to => Get.find()
                          UpdateController.to.increment();
                        },
                        child: Text("点击更新GetBuilder数据")),
                    Divider(height: 3,),

                    ///添加 init: UpdateController()后value就是UpdateController的实例
                    GetBuilder<UpdateController>(
                        init: UpdateController(),
                        builder: (value) {
                          return Text("GetBuilder=>${value.counter}");
                        }),
                    ///在Controller 中通过static UpdateController get to => Get.find()实例化
                    ///通过UpdateController.to获取变量
                    GetBuilder<UpdateController>(
                        builder: (value) {
                          return Text("GetBuilder=>${UpdateController.to.counter}");
                        }),
                    ///给定ID，需要在Controller中update(["text3"]);设置，精准更新UI
                    GetBuilder<UpdateController>(
                        id: "text3",
                        builder: (value) {
                          return Text("通过ID准确更新指定的UI=>${UpdateController.to.counter}");
                        }),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () => Get.to(NewPage()),
                child: Text('GetX中 依赖注入的使用')
            ),

            ElevatedButton(
                onPressed: () => Get.to(HtmlPage()),
                child: Text('测试Flutter html')
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录界面'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}
