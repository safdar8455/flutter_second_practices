import 'dart:async';

import 'package:flutter/material.dart';
import 'package:secondapp/introPage.dart';
import 'package:secondapp/main.dart';

class splashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _splashPage();
}

class _splashPage extends State<splashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => introPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
        child: Center(
          child: Text(
            'SHARINGLE',
            style: TextStyle(
                fontSize: 48,
                color: Colors.white,
                fontFamily: 'Monoton-Regular'),
          ),
        ),
      ),
    );
  }
}
