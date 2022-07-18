import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/UserWeight.dart';
import 'package:test_pro_mobile_app_documentation/Services/Firebase_Database.dart';

class Userweight extends StatefulWidget {

  String? UserName;
  String? UserGender;
  double? UserLength;
  double? UserAge;


  Userweight({this.UserGender,this.UserName,this.UserLength,this.UserAge});
  @override
  State<Userweight> createState() => _UserweightState();
}

class _UserweightState extends State<Userweight> {
  @override


  double? weight=20.00;
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotatedBox(quarterTurns: -1,
            child: Slider(
              value: weight!.toDouble(),
              min: 1,
              max: 150,

              label: '$weight',
              onChanged: (double newValue) {
                setState(() {
                  weight = newValue;
                });
              },
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Database(weight: weight,length: widget.UserLength,gender: widget.UserGender,age: widget.UserAge,name: widget.UserName,)),

            );

          }, child:Text('Next') ),
        ],
      ),
    );
  }
}
