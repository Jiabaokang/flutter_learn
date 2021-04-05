import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
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
    var num="a";
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

