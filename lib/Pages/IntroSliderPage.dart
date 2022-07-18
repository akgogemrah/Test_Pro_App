import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:test_pro_mobile_app_documentation/Pages/IntroSliderPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/GenderPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/GetUserNamePage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/UserAgePage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/UserLengthPage.dart';
import 'package:test_pro_mobile_app_documentation/Pages/UserDataBase/UserWeight.dart';





class MyHomePage extends StatefulWidget {
  String? UserName;

  MyHomePage({this.UserName});


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController controller;






  GlobalKey<PageContainerState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: ElevatedButton(onPressed: (){


    }, child: Text('Next')),

      body: Container(
        color: Colors.pink,
        child: Container(

          child: PageIndicatorContainer(
            key: key,
            child: PageView(

              children: <Widget>[
                GenderPage(),
                AgeUser(),
                Length(),
                Userweight(),
              ],
              controller: controller,
              reverse:false,
            ),
            align: IndicatorAlign.bottom,
            length: 4,
            indicatorSpace: 10.0,
          ),
        ),
      ),

    );
  }
}