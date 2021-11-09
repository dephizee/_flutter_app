import 'package:flutter/material.dart';

class Notification1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notification"),
          backgroundColor: Colors.blue[900],
        ),
        body: Center(
            child:Text("YOUR NOTIFICATION PAGE", style:TextStyle(fontSize: 20),)
        )
    );
  }
}
