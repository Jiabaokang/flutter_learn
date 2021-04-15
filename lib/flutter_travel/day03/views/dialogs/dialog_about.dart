import 'package:flutter/material.dart';

class DialogAbout extends StatelessWidget {
  final String imagePath = "assets/images/icon_head.png";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: _buildTitle(),
      content: _buildContent(),
      actions: <Widget>[
        GestureDetector(child:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("学习使用",),
        ),
        onTap: (){
          Navigator.of(context).pop();
        },)
      ],
    );
  }

  //标题
  Widget _buildTitle() => Row(
        children: [
          Image.asset(
            imagePath,
            width: 30,
            height: 40,
          ),
          SizedBox(
            width: 10,
          ),
          Text("关于")
        ],
      );

  Widget _buildContent() =>
      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        FlutterLogo(size: 50),
        SizedBox(height: 20),
        Text("Flutter lear V1.0.0"),
      ]);
}
