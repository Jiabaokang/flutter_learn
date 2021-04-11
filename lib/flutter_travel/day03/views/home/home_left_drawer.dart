import 'package:flutter/material.dart';

class HomeLeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Container(
        color: Colors.blue.withAlpha(55),
        child: Center(
          child: (
            Text("这是一个为实现Drawer")
          ),
        ),
      ),
    );
  }
}
