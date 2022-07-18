import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/UserLengthPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/UserWeight.dart';
import 'package:test_pro_mobile_app_documentation/Services/Firebase_Database.dart';

class Length extends StatefulWidget {
  String? UserName;
  String? UserGender;
  double? UserAge;

  Length({this.UserName,this.UserGender,this.UserAge});

  @override
  State<Length> createState() => _LengthState();
}

class _LengthState extends State<Length> {
  @override

  double? length=10.0;
  Widget build(BuildContext context) {
  return  Scaffold(
      body:
      Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotatedBox(quarterTurns: -1,
            child: Slider(
              value: length!.toDouble(),
              min: 10,
              max: 220,

              label: '$length',
              onChanged: (double newValue) {
                setState(() {
                  length = newValue;
                });
              },
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Userweight(UserAge: widget.UserAge,UserLength: length,UserName: widget.UserName,UserGender: widget.UserGender,)),

            );
          }, child:Text('Next') ),
        ],
      ),
    );
  }
}
