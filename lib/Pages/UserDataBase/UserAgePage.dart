import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/UserLengthPage.dart';
import 'package:test_pro_mobile_app_documentation/Services/Firebase_Database.dart';

class AgeUser extends StatefulWidget {
  String? UserName;
  String? UserGender;

  AgeUser({this.UserName,this.UserGender});

  @override
  State<AgeUser> createState() => _AgeUserState();
}

class _AgeUserState extends State<AgeUser> {
  double? age=1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotatedBox(quarterTurns: -1,
            child: Slider(
              value: age!.toDouble(),
              min: 1,
              max: 110,

              label: '$age',
              onChanged: (double newValue) {
                setState(() {
                  age = newValue;
                });
              },
            ),
          ),
          ElevatedButton(onPressed: (){

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Length(UserAge: age,UserName: widget.UserName,UserGender: widget.UserGender,)),

            );
          }, child: Text('Next')),
        ],
      ),
    );
  }
}
