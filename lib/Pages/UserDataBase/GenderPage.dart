

import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/GenderPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/UserAgePage.dart';
import 'package:test_pro_mobile_app_documentation/Services/Firebase_Database.dart';

class GenderPage extends StatefulWidget {
  String? UserName;
  GenderPage({this.UserName});

  @override
  State<GenderPage> createState() => _GenderPageState();
}









class _GenderPageState extends State<GenderPage> {
  @override

  String? Gender;
  String? Name;


  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        Center(child: Text("Whats your sex ?",style: TextStyle(height: 20,fontWeight: FontWeight.bold),)),
        // SizedBox(height: MediaQuery.of(context).size.height*0.2,),
        Center(
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(width: MediaQuery.of(context).size.width*0.4,child: GestureDetector(onTap: (){
                setState(() {
                  Gender='Female';
                });



              },child: Container(height: MediaQuery.of(context).size.height*0.2,color: Gender=='Female'?Colors.red:Colors.white,child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.male,size: 40),

                ],


              )),



              )),
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.1,),
            SizedBox(width: MediaQuery.of(context).size.width*0.4,child: GestureDetector(onTap: (){
              setState(() {
                Gender='Male';
              });



            },child: Container(height: MediaQuery.of(context).size.height*0.2,color: Gender=='Male'?Colors.blue:Colors.white,child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.female,size: 40),
              ],

            )),



            )),
            Divider(),





          ],),


        ),
        Row(children: [
    SizedBox(width: MediaQuery.of(context).size.width*0.4,child:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text('Female')),
    )),
          SizedBox(width: MediaQuery.of(context).size.width*0.1,),
          SizedBox(width: MediaQuery.of(context).size.width*0.4,child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Male'),
            )),
          )),

        ]),
        ElevatedButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AgeUser(UserName: widget.UserName,UserGender: Gender,)),

          );
        }, child: Text('Next')),
      ],
    )


      ,);
  }
}
