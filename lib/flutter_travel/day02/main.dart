import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  testDart();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterDemo",
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(title:'验证数据同步及操作符'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({ Key key,this.title}):super(key: key);
  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _info = "parse";

  void _incrementCounter() {
    var num="12";
    setState(() {
      var str2num = str2Num(num);
      if( str2num!=null){
        _info = '$str2num';
      }else{
        _info='转换异常，请输入正确数字';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_info,style: TextStyle(color: Colors.red),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: (){
          _incrementCounter();
        },
      ),
    );
  }

  num str2Num(String str){//捕捉全部异常
    var result= 0;
    try {
      result= num.parse(str);
    } catch (e) {
      print('发生异常：$e');
      return null;
    } finally {
      print('最终会被执行的代码块');
    }
    return result;
  }

}

void testDart(){
  var a = 20;
  var b;
  var c = b ?? a++;
  print("类似三元运算符 ?? 返回值==>>a=$a,c=$c"); //返回null；

  //类似三元运算符
  var e = 20;
  var f = 5;
  var g = f ?? e++;
  print("类似三元运算符 ?? 返回值==>>$e=$e,g=$g"); //返回null；

  //对象为null
  String str;
  //print(str.isEmpty);这个会奔溃的

  var str2 = "555";
  str2 = str;
  print("对象使用?.语法返回值==>>${str2?.length}"); //返回null；

  //1、对象属性的传统赋值方式；
  var paint = Paint();
  paint.strokeCap = StrokeCap.round;
  paint.style = PaintingStyle.stroke;
  paint.color = Color(0xffBBC3C5);
  paint.isAntiAlias = true;

  //2、对象属性的 级联操作符
  var paintA = Paint()
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..color = Color(0xffBBC3C5)
    ..isAntiAlias = true;
  print("属性值paintA==>>$paintA");

  //3、使用3个点...对数据进行结构
  var land = <String>["Java","Kotlin"];
  print("原始数据==>>$land");
  land = ["Dart","Python",...land];
  print("解构后的的数据==>>${land.toString()}");
}



