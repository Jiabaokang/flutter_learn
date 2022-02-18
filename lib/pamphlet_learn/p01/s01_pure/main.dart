

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_learn/pamphlet_learn/p01/s01_pure/paper.dart';

void main(){
  //确定初始化
  WidgetsFlutterBinding.ensureInitialized();
  //横屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  //全屏显示
  SystemChrome.setEnabledSystemUIOverlays([]);
  //运行demo
  runApp(Paper());
}