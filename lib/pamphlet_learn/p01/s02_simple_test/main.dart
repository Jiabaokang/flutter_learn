import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_learn/pamphlet_learn/p01/s02_simple_test/paper.dart';
import '../../../utils/status_bar_utils.dart';

/// author : JiaBaoKang
/// e-mail : jiabaokangsy@gmail.com
/// date   : 2022/2/17 14:46
/// desc   : 测试demo

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  StatusBarUtils.setStatusBarLight();
  runApp(Pager());
}