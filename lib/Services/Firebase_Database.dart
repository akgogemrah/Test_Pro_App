import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app_documentation/Services/Firebase_Database.dart';

class Database extends StatelessWidget {
String? name;
String? gender;
double? age;
double? weight;
double? length;
Database({this.name,this.weight,this.length,this.age,this.gender});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(onPressed: (){
print(name);
      }, child: null,),
    );
  }
}







