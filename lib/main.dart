import 'package:flutter/material.dart';
import 'package:secondapp/bmiModel.dart';
import 'package:secondapp/listWeelScroll.dart';
import 'package:secondapp/rippleAnimation.dart';
import 'package:secondapp/shared_Preferences.dart';
import 'package:secondapp/splashPage.dart';
import 'package:secondapp/tweenAnimation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: shared_Preferences(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
  final String Uname;
  MyHomePage(this.Uname);
}

class _MyHomePageState extends State<MyHomePage> {
  RangeValues values = RangeValues(0, 100);
  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
        appBar: AppBar(
          title: Text("Hellow"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.Uname,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              RangeSlider(
                  values: values,
                  labels: labels,
                  divisions: 40,
                  activeColor: Colors.amber[900],
                  min: 0,
                  max: 100,
                  onChanged: (newValue) {
                    values = newValue;
                    setState(() {
                      print(
                          '${values.start.toString()}, ${values.end.toString()}');
                    });
                  }),
              SizedBox(
                height: 21,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => bmiModel(),
                        ));
                  },
                  child: Text('Check BMI')),
            ],
          ),
        ));
  }
}
