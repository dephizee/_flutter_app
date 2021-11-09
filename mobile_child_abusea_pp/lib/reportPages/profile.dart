import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child:Text("YOUR PERSONAL DETAILS PAGE", style:TextStyle(fontSize: 20),)
      )
    );
  }
}
