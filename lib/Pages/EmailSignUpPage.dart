import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pro_mobile_app_documentation/Services/Firebase_Auth.dart';
enum FormStatus { signIn, register, reset }
class EmailSignupPage extends StatefulWidget {


  @override
  State<EmailSignupPage> createState() => _EmailSignupPageState();
}

class _EmailSignupPageState extends State<EmailSignupPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(body: BuildRegisterForm());
  }
  Widget BuildRegisterForm(){

    final _RegisterFormKey = GlobalKey<FormState>();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _passwordConfirmController = TextEditingController();
return Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Form(key: _RegisterFormKey,child: Column(
mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextFormField(
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
      SizedBox(
        height: 10,
      ),
      TextFormField(
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
            hintText: 'Create your password',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0))),
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        controller: _passwordConfirmController,
        validator: (value) {
          if (value != _passwordController.text) {
            return 'Şifreler Uyuşmuyor';
          } else {
            return null;
          }
        },
        obscureText: true,
        decoration: InputDecoration(
          
            prefixIcon: Icon(Icons.lock),
            hintText: 'Confirm your password',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0))),
      ),
      SizedBox(
        height: 10,
      ),
      ElevatedButton(
        onPressed: () async {

            if (_RegisterFormKey.currentState!.validate()) {
              final user = await Provider.of<Auth>(context,
                  listen: false)
                  .createUserWithEmailAndPassword(
                  _emailController.text, _passwordController.text);
              await Provider.of<Auth>(context, listen: false).signOut();

            }




        },
        child: Text('Continue'),
      ),
    ],
  )



  ),
);
  }
}
