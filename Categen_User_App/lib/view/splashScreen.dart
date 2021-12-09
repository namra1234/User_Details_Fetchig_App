import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/common/colorConstants.dart';
import 'package:sample_project/common/constants.dart';

import 'userScreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loginCheck();
  }

  void loginCheck() async {
    var _duartion = new Duration(
      seconds: Constants.SPLASH_SCREEN_TIME,
    );




    Timer(_duartion, () async {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => UserScreen() ), (Route<dynamic> route) => false
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Constants.screenWidth = MediaQuery.of(context).size.width;
    Constants.screenHeight = MediaQuery.of(context).size.height;
    Constants.textscaleFactor = MediaQuery.of(context).textScaleFactor;
    Constants.blockSizeHorizontal = Constants.screenWidth / 100;
    Constants.blockSizeVertical = Constants.screenHeight / 100;
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: Constants.screenHeight,
              width: Constants.screenWidth,
              child: Image.asset(
                'assets/images/categen.jfif',
              ),
            ),
          ),

        ],
      ),
    );
  }

  letsStart() {
    print('welcome');
  }
}
