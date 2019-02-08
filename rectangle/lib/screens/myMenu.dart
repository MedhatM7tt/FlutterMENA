import 'package:flutter/material.dart';

class MyMenuDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      //or //new Column();
      children: <Widget>[
        AppBar(
          automaticallyImplyLeading: false,
        ),
        ListTile(
          onTap: () {},
          title: Text("Test"),
        )
      ],
    );
  }
}
