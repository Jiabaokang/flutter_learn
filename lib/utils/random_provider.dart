
import 'dart:math';

class RandomProvider{
  ///私有构造函数
  RandomProvider._();
  static final _random = Random();
  static get random =>_random;
}