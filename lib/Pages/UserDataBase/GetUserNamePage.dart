import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app_documentation/Pages/IntroSliderPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/GenderPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/GetUserNamePage.dart';
import 'package:test_pro_mobile_app_documentation/Services/Firebase_Database.dart';


class GetUserName extends StatelessWidget {

  late String UserName;

  final _GetUsernameFormKey = GlobalKey<FormState>();
  TextEditingController _UserNameController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.3,
            child: Center(
              child: Text('Your name?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),

              ),
            ),
          ),
          Form(key: _GetUsernameFormKey, child: Column(
            children: [
              TextFormField( keyboardType: TextInputType.text,decoration: InputDecoration(hintText: 'Name',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),controller: _UserNameController,validator: (value){
                if(value!.length<=0){

                  return 'Please Enter a name';
                }
                else{
return null;
                }



                
              }

                
                
                ,)

            ],
          )



          ),

          ElevatedButton(onPressed: (){

if(_GetUsernameFormKey.currentState!.validate()) {
  UserName=_UserNameController.text;



  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => GenderPage(UserName: UserName,)),
      
  );

}

          }, child: Text("Continue")),
        ],
      )

    );

  }
}
