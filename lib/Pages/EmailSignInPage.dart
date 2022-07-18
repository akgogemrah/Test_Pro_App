

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pro_mobile_app_documentation/Services/Firebase_Auth.dart';
class EmailSignInPage extends StatefulWidget {


  @override
  State<EmailSignInPage> createState() => _EmailSignInPageState();
}


class _EmailSignInPageState extends State<EmailSignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuildSignInForm(),
    );
  }
  Widget BuildSignInForm(){
    final _SignInFormKey = GlobalKey<FormState>();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Form(key: _SignInFormKey,child: Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _emailController,
            validator: (value) {
              if (!EmailValidator.validate(value!)) {
                return 'Please enter the a email adress';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'E-mail',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value!.length < 6) {
                return 'Şifreniz en az 6 karakter olmalıdır';
              } else {
                return null;
              }
            },

            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        ElevatedButton(
          onPressed: () async {

            if (_SignInFormKey.currentState!.validate()) {
              final user = await Provider.of<Auth>(context,
                  listen: false)
                  .signInWithEmailAndPassword(
                  _emailController.text, _passwordController.text);
              await Provider.of<Auth>(context, listen: false).signOut();


            }




          },
          child: Text('Login your Accaunt'),
        ),



      ],
    ));
  }
}
