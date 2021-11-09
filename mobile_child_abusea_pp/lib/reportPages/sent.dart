import 'package:flutter/material.dart';

class Sent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Request Sent"),
          backgroundColor: Colors.blue[900],
        ),
        body: Center(
            child:Text("YOUR REQUEST SENT PAGE", style:TextStyle(fontSize: 20),)
        )
    );
  }
}
