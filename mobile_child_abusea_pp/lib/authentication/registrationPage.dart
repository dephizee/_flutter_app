import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_child_abusea_pp/networks/utils.dart';
import 'package:mobile_child_abusea_pp/reportPages/report.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'loginPage.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _showPassword=false;
  TextEditingController _fullname = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  String gender_value = "male";

  handleRegister (){

    if(_fullname.text.isEmpty){
      Toast.show("Invalid Name", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
    }else if(_email.text.isEmpty){
      Toast.show("Invalid Email", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
    }else if(_phone.text.isEmpty){
      Toast.show("Invalid Phone", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
    }else if(_password.text.isEmpty){
      Toast.show("Invalid Password", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
    }else{

      this.registerNetworkCall(_fullname.text, gender_value, _email.text, _phone.text, _password.text );
    }

  }

  registerNetworkCall  (fullname, gender, email, phone, password) async {
    setState(()=> this._loading = true);
    // var url = Uri.parse(NetwortUtils.HOST+'users/signin');
    var response = await http.post((NetwortUtils.HOST+'users/signup'),
        body: { 'fullname': fullname,
          'email': email,
          'phone': phone,
          'gender': gender,
          'password': password,
        }
        );
    log('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');
    setState(()=> this._loading = false);
    if(response.statusCode!=200){
      Map body = jsonDecode(response.body);
      for(final value in body.values){
        Toast.show(value, context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
      }
    }else{
      Toast.show("Registration was successfull", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('user_data', response.body);




      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder:(context)=> Report(),
        ),
      );
    }



    // print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }





  bool _loading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color:Colors.blue[900],
                    borderRadius:BorderRadius.only(bottomRight: Radius.circular(250))
                ),
                child:Padding(
                  padding:EdgeInsets.only(left:30, top: 80),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text("SignUp",
                            style:TextStyle(color:Colors.white,
                                fontSize:45,
                                fontFamily:"AnonymousPro",
                                fontWeight:FontWeight.bold)),
                       ]
                  ),
                  //
                ),
              ),
              SizedBox(height:30,),
              CircleAvatar(
                backgroundColor:Colors.white10,
                radius:80,
               child:IconButton(
                 icon: Icon(
                     Icons.add_a_photo_rounded,color:Colors.grey,size:80), onPressed: () {  },)
                ),
              Padding(
                padding: EdgeInsets.only(top: 0.0,left:30),
                child: Text("upload image",
                    style: TextStyle(
                        fontSize: 20,
                        color:Colors.grey,
                      // fontFamily: "Itim",
                        )),
              ),
              SizedBox(height:60,),
              Padding(
                padding:EdgeInsets.all(20),
                child:Container(
                  decoration:BoxDecoration(
                    border:Border.all(color:Colors.black38),
                    borderRadius:BorderRadius.circular(20),
                  ),
                  child:Padding(
                    padding:EdgeInsets.only(left: 0,),
                    child:TextFormField(
                      controller: _fullname,
                      decoration:InputDecoration(
                          border:InputBorder.none,
                          hintText:"Name",
                          icon:Icon(Icons.person)
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding:EdgeInsets.all(20),
                child:Container(
                  decoration:BoxDecoration(
                    border:Border.all(color:Colors.black38),
                    borderRadius:BorderRadius.circular(20),
                  ),
                  child:Padding(
                    padding:EdgeInsets.only(left: 0,),
                    child:TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration:InputDecoration(
                          border:InputBorder.none,
                          hintText:"Email",
                          icon:Icon(Icons.email)
                      ),
                    ),
                  ),
                ),
              ),

              RadioListTile(
                    title:Text("Male"),
                    groupValue: gender_value,
                    value: "male",
                    onChanged: (ind) => setState(() => this.gender_value = "male"),
                  ),
              RadioListTile(
                title:Text("Female"),
                groupValue: gender_value,
                value: "female",
                onChanged: (ind) => setState(() => this.gender_value = "female"),
                  ),
        
              Padding(
                padding:EdgeInsets.all(20),
                child:Container(
                  decoration:BoxDecoration(
                    border:Border.all(color:Colors.black38),
                    borderRadius:BorderRadius.circular(20),
                  ),
                  child:Padding(
                    padding:EdgeInsets.only(left: 0,),
                    child:TextFormField(
                      controller: _phone,
                      keyboardType: TextInputType.phone,
                      decoration:InputDecoration(
                          border:InputBorder.none,
                          hintText:"phone Number",
                          icon:Icon(Icons.call)
                      ),
                    ),
                  ),
                ),
              ),


              Padding(
                padding:EdgeInsets.all(20),
                child:Container(
                  decoration:BoxDecoration(
                    border:Border.all(color:Colors.black38),
                    borderRadius:BorderRadius.circular(20),
                  ),
                  child:Padding(
                    padding:EdgeInsets.only(left: 0,),
                    child:TextFormField(
                      controller: _password,
                      obscureText:!this._showPassword,
                      decoration:InputDecoration(
                        border:InputBorder.none,
                        hintText:"Password",
                        icon:Icon(Icons.lock),
                        suffixIcon: IconButton(
                            icon:Icon(Icons.remove_red_eye,
                                color: this._showPassword ? Colors.blue:Colors.grey),
                            onPressed:(){
                              setState(()=> this._showPassword = !this._showPassword);
                            }
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child:(!_loading?Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    border:Border.all(color:Colors.grey),
                    borderRadius:BorderRadius.circular(20),
                  ),
                  child:FlatButton(
                      onPressed:(){
                        this.handleRegister();
                      },
                      child: Text("Register", style:TextStyle(fontSize: 20, color:Colors.white))
                  ),
                ):CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  semanticsLabel: 'Linear progress indicator',
                )),
              ),


             ]
          )
      ),
    );
  }
}
