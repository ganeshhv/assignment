import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool animated = true;
  startTime() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route()
  {
    Navigator.pushReplacement(context,
        MaterialPageRoute(
            builder: (context) => HomePage()));
  }


  @override
  Widget build(BuildContext context) {
    startTime();
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('COMICS', style: TextStyle(
                  fontSize: 24
                ),),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}