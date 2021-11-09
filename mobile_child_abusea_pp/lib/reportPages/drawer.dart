import 'dart:ui';
import '../main.dart';
import 'profile.dart';
import 'notifications.dart';
import 'sent.dart';
import 'aboutUsPage.dart';


import 'package:flutter/material.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            Container(
              width:double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.blue[900],
              child: Center(
                child: Column(
                    children:[
                      Container(
                        width:100,
                        height:100,
                        margin: EdgeInsets.only(top:30, bottom: 10,),
                          decoration: BoxDecoration(
                            border:Border.all(color: Colors.white),
                            borderRadius:BorderRadius.circular(10),
                            image:DecorationImage(
                              image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7rivMJs1BNY5Sq3kA7vwo2dHpqCYHh2PI9Hn00uLJlBWIMmzU&s"),
                              fit:BoxFit.cover,
                            ),
                          ),

                        ),

                      Text("Asalu Temitope Peter",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white),
                      ),

                      Text("topetemi285@gmail.com",
                          style: TextStyle(
                              color:Colors.white
                          )),
                    ]
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.person,color:Colors.black),
              title: Text("Home",
                style:TextStyle(
                    fontSize: 19,
                    fontFamily: "Caveat",
                    fontWeight: FontWeight.bold
                ),),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:(context)=> Profile(),
                  ),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.notification_important,color:Colors.black),
              title: Text("Child welfare",
                style: TextStyle(
                    fontSize: 19,
                    fontFamily: "Caveat",
                    fontWeight: FontWeight.bold
                ),
              ),
              onTap: (){
                Navigator.of(context).push(
                MaterialPageRoute(
                builder:(context)=> Notification1(),
              ),
            );
              },
            ),

            ListTile(
              leading: Icon(Icons.send,color:Colors.black),
              title: Text("Emergence Contact",
                style: TextStyle(
                    fontSize: 19,
                    fontFamily: "Caveat",
                    fontWeight: FontWeight.bold
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=> Sent()));
              },
            ),

            ListTile(
              leading: Icon(Icons.calendar_today_outlined,color:Colors.black),
              title: Text("About App",
                style: TextStyle(
                    fontSize: 19,
                    fontFamily: "Caveat",
                    fontWeight: FontWeight.bold
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=> aboutUspage()));
              },
            ),

            ListTile(
              leading: Icon(Icons.settings,color:Colors.black),
              title: Text("Report Abuse",
                style: TextStyle(
                    fontSize: 19,
                    fontFamily: "Caveat",
                    fontWeight: FontWeight.bold
                ),
              ),
              onTap: null,
            ),

            ListTile(
              leading: Icon(Icons.help_outline,color:Colors.black),
              title: Text("Help & feedback",
                style: TextStyle(
                    fontSize: 19,
                    fontFamily: "Caveat",
                    fontWeight: FontWeight.bold
                ),
              ),
              onTap: null,
            ),

            ListTile(
              leading: Icon(Icons.arrow_back, color:Colors.black),
              title:Text("LogOut",
                style:TextStyle(
                    fontSize: 19,
                    fontFamily: "Caveat",
                    fontWeight: FontWeight.bold
                ),),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=> RapeReportApp()));
              },

            )
          ],


        )
    );
  }
}