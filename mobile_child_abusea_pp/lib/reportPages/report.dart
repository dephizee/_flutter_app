import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_child_abusea_pp/networks/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import  'drawersFiles/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  TextEditingController _nature = new TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _numberOfPerson = TextEditingController();
  TextEditingController _committedByWho = TextEditingController();
   TextEditingController _description = TextEditingController();
   TextEditingController _person =TextEditingController();
   TextEditingController _doi =TextEditingController();
 File imageFile;
 final picker = ImagePicker();
 Map userData = null;
  bool _loading=false;

  void initState() {
    //TODO: implement initState
    super.initState();
    this.checkState();

  }

  checkState() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map user_data = jsonDecode(prefs.getString('user_data')??null);
    // log('token body: ${user_data['token']}');
    if(user_data!= null){
      setState(()=> this.userData = user_data);
    }


    // await prefs.setString('user_data', response.body);
  }
  reportNetworkCall  (natureOfAbuse, gender_value, ageValue, address, dateOfEvent, numberOfPerson, committedByWho, description) async {
    setState(()=> this._loading = true);
    // var url = Uri.parse(NetwortUtils.HOST+'users/signin');
    var response = await http.post((NetwortUtils.HOST+'report/create'),
        body: { 'offenderName': committedByWho,
                'natureofAbuse': natureOfAbuse,
                'description': description,
                'address': address,
            },
        headers: {
            'Authorization': this.userData['token']
        });
    // log('Response status: ${response.statusCode}');
    // log('Response body: ${response.body}');
    setState(()=> this._loading = false);
    if(response.statusCode!=200){
      Map body = jsonDecode(response.body);
      for(final value in body.values){
        Toast.show(value, context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
      }
    }else{
      Toast.show("Report Submitted", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder:(context)=> Report(),
        ),
      );
    }



    // print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }
  handleReport (){
    // log('nature of Abuse ${natureOfAbuse}');
    // log('Gender ${gender_value}');
    // log('Age Value ${ageValue}');
    // log('_address ${_address.text}');
    // log('dateOfEvent ${dateOfEvent}');
    // log('_numberOfPerson ${_numberOfPerson.text}');
    // log('_committedByWho ${_committedByWho.text}');
    // log('_description ${_description.text}');
    if(natureOfAbuse == null){
      Toast.show("Invalid Nature of Abuse", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
    }else if(ageValue == null){
      Toast.show("Age not Selected", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
    }else if(_address.text.isEmpty){
      Toast.show("Invalid Address", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
    }else if(dateOfEvent == null){
      Toast.show("Invalid Date of Event", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
    }else if(_numberOfPerson.text.isEmpty){
      Toast.show("Invalid Number of People", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
    }else if(_committedByWho.text.isEmpty){
      Toast.show("Invalid Offender Name", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
    }else if(_description.text.isEmpty){
      Toast.show("Invalid Description", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
    }else{

      this.reportNetworkCall(natureOfAbuse, gender_value, ageValue, _address.text, dateOfEvent, _numberOfPerson.text, _committedByWho.text, _description.text );
    }

  }

 openGallary() async{
   var picture = await await picker.getImage(source: ImageSource.camera);
   this.setState(() {
     if (picker != null) {
        imageFile = File(picture.path);
      } else {
        print('No image selected.');
      }
   });
 }
final types = ["Physical Abuse","Sexual Abuse","Emotional Abuse","Neglect Abuse"];
final age = ["0-10","11-15","15-18"];
String valuetypes;
String natureOfAbuse;
String ageValue;
String dateOfEvent;

int gender_value = 0;
 DropdownMenuItem<String>buildMenuItem(String item)=>
    DropdownMenuItem(
      value: item,
      child: Text(
        item,
       // style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20 ),
      ),);
DropdownMenuItem<String>buildMenuAge(String age)=>
    DropdownMenuItem(
      value: age,
      child: Text(
        age,
        
      ),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MOBILE RAPE REPORTING SYSTEM"),
        backgroundColor: Colors.blue[900],
      ),
      drawer:this.userData!=null?MainDrawer(this.userData):null,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            children: <Widget>[
              
              Container(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text("To make immediate report tab on the send button \n also you can report after event by taking a picture of the suspect and comment below"
                  ),
                ),
              ),
              Text("Nature of Abuse"),
              Container(
                margin: EdgeInsets.only(left:16, right: 16, bottom: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1)),
                 child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: natureOfAbuse,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_downward),
                    items: types.map(buildMenuItem).toList(),
                    onChanged: (value)=> 
                    setState(()=>
                    this.natureOfAbuse = value,
                     ) 
                    ),
                ),
              ),
 
              Text("Gender:"),
            
              RadioListTile(
                 title:Text("Male"),
                  groupValue: gender_value,
                  value: 0,
                  onChanged: (ind) => setState(() => this.gender_value = 0),
              ),
              RadioListTile(
                  title:Text("Female"),
                  groupValue: gender_value,
                  value: 1,
                  onChanged: (ind) => setState(() => this.gender_value = 1),

              ),
                
              

              Text("Age Range of victim:"),
              Container(
                margin: EdgeInsets.only(left:16, right: 16, bottom: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1)),
                 child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: ageValue,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_downward),
                    items: age.map(buildMenuAge).toList(),
                    onChanged: (value)=> 
                    setState(()=>
                    this.ageValue = value,
                     ) 
                    ),
                ),
              ),              
              Padding(
                  padding:EdgeInsets.all(10),
                  child:Container(
                      decoration:BoxDecoration(
                        border:Border.all(color: Colors.black),
                        borderRadius:BorderRadius.circular(20),
                      ),
                      child:Padding(
                          padding:EdgeInsets.only(left:20),
                          child:TextFormField(
                              controller: this._address,
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                hintText:"Address",
                              )
                          )
                      )
                  )
              ), 
                          Padding(
                              padding: EdgeInsets.all(8.0),
                              child:DateTimePicker(
                              initialValue: '',
                              type: DateTimePickerType.date,
                              dateLabelText: 'Date of event',
                              firstDate: DateTime(2020),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                              validator: (value){
                                return null;
                              },
                              onChanged: (value){
                                if(value.isNotEmpty){
                                    setState((){
                                      dateOfEvent = value;
                                  });
                                }
                              },
        
                            )
                          ),
              Padding(
                  padding:EdgeInsets.all(10),
                  child:Container(
                      decoration:BoxDecoration(
                        border:Border.all(color: Colors.black),
                        borderRadius:BorderRadius.circular(20),
                      ),
                      child:Padding(
                          padding:EdgeInsets.only(left:20),
                          child:TextFormField(
                              controller: _numberOfPerson,
                              keyboardType: TextInputType.number,
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                hintText:"Number of person",
                              )
                          )
                      )
                  )
              ),            
             

              Padding(
                  padding:EdgeInsets.all(10),
                  child:Container(
                      decoration:BoxDecoration(
                        border:Border.all(color: Colors.black),
                        borderRadius:BorderRadius.circular(20),
                      ),
                      child:Padding(
                          padding:EdgeInsets.only(left:20),
                          child:TextFormField(
                              controller: _committedByWho,
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                hintText:"Committed by who:",
                              )
                          )
                      )
                  )
              ),     
              Padding(
                  padding:EdgeInsets.all(10),
                  child:Container(
                      decoration:BoxDecoration(
                      border:Border.all(color: Colors.black),
                      borderRadius:BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                        controller: _description,
                        maxLines: 3,
                            // ignore: missing_return
                        validator: (input){
                            if(input.isEmpty)
                                return 'Enter Description';  
                                   },

                            decoration: InputDecoration( 
                              
                              labelText: 'Description',
                                  )      //onSaved: (input)=>_email=input,
                                  ),
                              ),
                               ),
              ),      
              Row(
                children:[
                  
                      Container(
                        //padding: EdgeInsets.symmetric(vertical: 50),
                        child: IconButton(
                            icon: Icon(Icons.add_a_photo_rounded, size: 40, color:Colors.indigo[900]),
                            onPressed: () {
                              openGallary();
                            },
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.all(20),
                        child: IconButton(
                            icon: Icon(Icons.send, size: 40, color:Colors.indigo[900]),
                            onPressed:(){
                              this.handleReport();
                            }
                        ),
                      ),

                    ]
                  ),
                    Padding(
                padding: EdgeInsets.all(20),
                child:(!this._loading?Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    border:Border.all(color:Colors.grey),
                    borderRadius:BorderRadius.circular(20),
                  ),
                  child:FlatButton(
                      onPressed:(){
                        this.handleReport();
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder:(context)=> LoginPage(),
                        //   ),
                        // );
                      },
                      child: Text("Report", style:TextStyle(fontSize: 20, color:Colors.white))
                  ),
                ):CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                    semanticsLabel: 'Linear progress indicator',
                )),
              ),
                ]
              ),



              // MaterialButton(
              //   onPressed: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => RegistrationPage(),
              //       ),
              //     );
              //   },
              //
              // ),

            
      ),
    );
   
  }
}