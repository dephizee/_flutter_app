import 'package:flutter/material.dart';

class Welfare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welfare"),
          backgroundColor: Colors.blue[900],
        ),
        body: Center(
            child:Text("Write Ups on child's welfare", style:TextStyle(fontSize: 20),)
        )
    );
  }
}
