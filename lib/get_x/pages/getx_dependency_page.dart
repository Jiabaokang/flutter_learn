import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/get_x/controller/sum_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SumController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("GetX中的依赖管理"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() =>
                Text("这是在第二个页面获取：上个页面的controller${controller.count1}"
                    , style: Theme
                        .of(Get.context)
                        .textTheme
                        .headline6,)),

            Obx(() =>
                Text("这是在第二个页面获取：上个页面的controller${controller.count2}"
                  , style: Theme
                      .of(Get.context)
                      .textTheme
                      .headline6,)),
          ],
        ),
      ),
    );
  }
}
