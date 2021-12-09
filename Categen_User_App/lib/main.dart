import 'package:flutter/material.dart';

import 'view/splashScreen.dart';

void main() => runApp(CateganUserApp());

class CateganUserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.grey,
          scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(),
    );
  }
}