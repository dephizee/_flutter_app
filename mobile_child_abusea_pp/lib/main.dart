import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'reportPages/drawersFiles/aboutUsPage.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: Colors.indigo[900],
    accentColor: Colors.white,
  ),
  home: RapeReportApp(),
));

class RapeReportApp extends StatefulWidget {

  @override
  _RapeReportAppState createState() => _RapeReportAppState();
}

class _RapeReportAppState extends State<RapeReportApp> {
  void initState() {
     //TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
            (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>aboutUspage ()),);

        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit:StackFit.expand,
        children:<Widget>[
          Container(
            decoration: BoxDecoration(
              // color: Colors.indigo[900],
              image:DecorationImage(
                image:AssetImage("assets/images (4).jpeg"),
                fit:BoxFit.cover,
              ),
            ),

          ),
          Column(
            mainAxisAlignment:MainAxisAlignment.start,
            children:<Widget>[
              Expanded(
                flex:2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor:Colors.white,
                        radius:50,
                          backgroundImage:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKry1JPPfPf6VvP6ojqTO8W-QplS9tzn8-0Fp-UQlqnVvDw7XM&s"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0,left:10),
                        child: Text("DETECT SCREAMING",
                            style: TextStyle(
                                fontSize: 35,
                                color:Colors.white,
                                // fontFamily: "Itim",
                                fontWeight: FontWeight.bold)),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top:20),
                          child: Text("With Just A Click", style: TextStyle(fontSize: 20,
                              color:Colors.white,fontFamily: "Caveat",
                              fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),

              ),
              Expanded(
                flex:1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                        CircularProgressIndicator(),
                          Padding(
                            padding:EdgeInsets.only(top: 23.0),
                          ),
                            Text("Say No To Rape \n with Rape Reporting App",
                              style: TextStyle(color:Colors.white,
                                fontSize: 10.0, fontWeight: FontWeight.bold)),
                      ]
                  ),
              ),
          ]

          )
        ]
      )
    );
  }
}




