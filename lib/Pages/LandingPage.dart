import 'package:flutter/material.dart';
import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:provider/provider.dart';
import 'package:test_pro_mobile_app_documentation/Pages/Tabbar.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/GetUserNamePage.dart';
import 'package:test_pro_mobile_app_documentation/Services/Firebase_Auth.dart';


class LandingPage extends StatefulWidget {



  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    bool _isLoading=false;
    Future<void> _signInWithGoogle() async {
      setState(() {
        _isLoading = true;
      });

      final user =
      await Provider.of<Auth>(context, listen: false).signInWithGoogle();
      setState(() {
        _isLoading = false;
      });

      print(user?.uid);
      print(user?.email);
    }
    Future<void> _signInAnonim() async {
      setState(() {
        _isLoading = true;
      });

      final user =
      await Provider.of<Auth>(context, listen: false).signInAnonymously();
      setState(() {
        _isLoading = false;
      });

      print(user?.uid);

    }
    Future<void> _signInFacebbok() async {
      setState(() {
        _isLoading = true;
      });

      final user =
      await Provider.of<Auth>(context, listen: false).signInWithFacebook();
      setState(() {
        _isLoading = false;
      });

      print(user.user);

    }
    return Scaffold(

      body: Center(

        child: Column(


            children: [

              Divider(height: MediaQuery.of(context).size.height*0.3,),
          SignInButton(
            width: MediaQuery.of(context).size.width*0.8,

            button: Button.GoogleBlack,
            small: false,

           onPressed: (){
              _signInWithGoogle();

           },
          ),
Divider(height: MediaQuery.of(context).size.height*0.01),
SignInButton(width: MediaQuery.of(context).size.width*0.8
  ,button: Button.Facebook,
 onPressed: (){
  _signInFacebbok();

 },
),
ElevatedButton(onPressed:(){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const TabsignInMail()),
  );
}, child: Text('Click to enter with e-mail and password')),

Padding(
  padding: const EdgeInsets.all(8.0),

  child:   ElevatedButton(onPressed: ()async{


     await _signInAnonim();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GetUserName()),
    );


  }, child: Text('Kayıt olmadan devam edin')),
),
        ]),
      ),
    );
  }
}
