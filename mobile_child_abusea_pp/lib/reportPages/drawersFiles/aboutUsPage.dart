import 'package:flutter/material.dart';
import 'package:mobile_child_abusea_pp/authentication/loginPage.dart';


class aboutUspage extends StatefulWidget {
  @override
  _aboutUspageState createState() => _aboutUspageState();
}

class _aboutUspageState extends State<aboutUspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       child: Column(
         children:[
          SizedBox(height:100,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              // CircleAvatar(
              //   backgroundColor:Colors.white,
              //   radius:100,
              //   child: Image(
              //     image:AssetImage("assets/images (3).jpeg",),
              //   ),
              //
              // ),
              Container(
                width:300,
                height:300,
                margin: EdgeInsets.only(top:30, bottom: 10,),
                decoration: BoxDecoration(
                  border:Border.all(color: Colors.white),
                  borderRadius:BorderRadius.circular(300),
                  image:DecorationImage(
                    image:AssetImage("assets/images (3).jpeg"),
                    fit:BoxFit.cover,
                  ),
                ),

              ),

              Container(
                padding: EdgeInsets.only(left:5,right:5),
                child: Text("DETECT SCREAMING", style: TextStyle(fontSize: 35, fontWeight:FontWeight.bold, color:Colors.blue[900])),
              ),

              Container(
                padding: EdgeInsets.only(left:5),
                child: Text("If you've been victim of rape or sexual assault, there are many different ways\n you can report to the authority but most time is time consuming and some \ntime victim might not want to talk about it or don't no how to say the case but\n with this App you can make a simple click to make any rape report ",
                    style: TextStyle(fontSize: 10, color:Colors.black)),
              ),
              SizedBox(height:30),
              Container(
                padding: EdgeInsets.only(left:5,right:5),
                child: Text("TERMS AND CONDITION", style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold, color:Colors.blue[900])),
              ),

              Container(
                padding: EdgeInsets.only(left:5),
                child: Text("If you've been victim of rape or sexual assault, there are many different ways\n you can report to the authority but most time is time consuming and some \ntime victim might not want to talk about it or don't no how to say the case but\n with this App you can make a simple click to make any rape report ",
                    style: TextStyle(fontSize: 10, color:Colors.black)),
              ),

                  Row(
                    children: [
                      MaterialButton(
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:(context)=> LoginPage(),
                            ),
                          );
                        },
                        child: Text("Accept",
                          style:TextStyle(color: Colors.black,
                              fontSize: 25,
                              fontFamily: "Caveat",
                              fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),

            ],
          ),

           ]
      ),
       ),
      //),
    );
  }
}
