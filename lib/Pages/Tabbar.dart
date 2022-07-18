import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app_documentation/Pages/EmailSignInPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/EmailSignUpPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/LandingPage.dart';




class TabsignInMail extends StatefulWidget {
  const TabsignInMail({Key? key}) : super(key: key);

  @override
  State<TabsignInMail> createState() => _TabsignInMailState();
}

class _TabsignInMailState extends State<TabsignInMail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  LandingPage()),
        );
      }, icon: Icon(color: Colors.black,Icons.arrow_back_ios),),backgroundColor: Colors.white),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(

                backgroundColor: Colors.white,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(

                    text: "Sıgnup",
                  ),
                  Tab(

                    text: "SıgnIn",
                  ),

                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: EmailSignupPage(),
                    ),
                    Center(
                      child: EmailSignInPage(),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
