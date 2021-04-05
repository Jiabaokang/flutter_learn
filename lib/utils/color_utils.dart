import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/utils/random_provider.dart';

class ColorsUtils {
  ///获取的颜色随机值
  static Color randomColor({
    int limitA = 120,
    int limitB = 0,
    int limitG = 0,
    int limitR = 0,
  }) {
    final Random random = RandomProvider.random;
    var a = limitA + random.nextInt(256 - limitA);
    var b = limitB + random.nextInt(256 - limitB);
    var g = limitB + random.nextInt(256 - limitG);
    var r = limitB + random.nextInt(256 - limitR);
    return Color.fromARGB(a, r, g, b);
  }

  ///将String值解析为颜色
  static Color parse(String colorCode) {
    Color result = Colors.red;
    var value = 0;
    if (colorCode.contains("#")) {
      try {
        value = int.parse(colorCode.substring(1), radix: 16);
      } catch (e) {
        print(e);
      }
      switch (colorCode.length) {
        case 1 + 6: //6位字符串color值
          result = Color(value + 0xFF000000);
          break;
        case 1 + 8: //8位字符串color值
          result = Color(value);
          break;
        default:
          result = Colors.red;
      }
      return result;
    }
  }



}
