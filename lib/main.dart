import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pro_mobile_app_documentation/Pages/EmailSignUpPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/IntroSliderPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/LandingPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/GenderPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/GetUserNamePage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/UserAgePage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/UserLengthPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/UserWeight.dart';
import 'package:test_pro_mobile_app_documentation/Services/Firebase_Auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization=Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context)=>Auth(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
         future: _initialization,


          builder: (context,snapshot){
            if(snapshot.hasError){
              return Text('Bir hata var');
            }

            else if(snapshot.hasData){

              return GetUserName();
            }
            else{
              return Text("Bir şeyler ters gidiyor");
            }

          },
        )
      ),
    );
  }
}

