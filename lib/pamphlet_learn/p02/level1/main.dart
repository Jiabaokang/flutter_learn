import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_learn/pamphlet_learn/p02/level1/paper.dart';
import 'package:flutter_getx_learn/utils/status_bar_utils.dart';

/// author : JiaBaoKang
/// e-mail : jiabaokangsy@gmail.com
/// date   : 2022/2/17 16:02
/// desc   :

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  StatusBarUtils.setStatusBarLight();
  runApp(Paper());
}