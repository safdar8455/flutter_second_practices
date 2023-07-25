import 'package:flutter/material.dart';

class bmiModel extends StatefulWidget {
  @override
  State<bmiModel> createState() => _bmiModel();
}

class _bmiModel extends State<bmiModel> {
  Color bgColor = Colors.grey.shade300;
  TextEditingController weight = TextEditingController();
  TextEditingController feet = TextEditingController();
  TextEditingController inches = TextEditingController();
  String result = "";
  String msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Model'),
        ),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  msg,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 21,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weight,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.line_weight),
                    hintText: 'Enter body weight!',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade900,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: feet,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    hintText: 'Enter body height in feet!',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade900,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: inches,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    hintText: 'Enter body height in inches!',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade900,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    String weightValue = weight.text;
                    String feetValue = feet.text;
                    String inchesValue = inches.text;

                    if (weightValue.isNotEmpty &&
                        feetValue.isNotEmpty &&
                        inchesValue.isNotEmpty) {
                      double wtValue = double.parse(weightValue);
                      double ftValue = double.parse(feetValue);
                      double inValue = double.parse(inchesValue);

                      double totalInches = (ftValue * 12) + inValue;
                      double totalMtr = totalInches * 0.0254;
                      double bmi = wtValue / (totalMtr * totalMtr);

                      setState(() {
                        result = bmi.toStringAsFixed(2);
                        if (bmi < 18) {
                          bgColor = Colors.red.shade200;
                          msg = "You are Underweight";
                        } else if (bmi > 25) {
                          bgColor = Colors.orange.shade200;
                          msg = "You are Overweight";
                        } else {
                          bgColor = Colors.green.shade200;
                          msg = "You are Healthy";
                        }
                      });
                    } else {
                      setState(() {
                        msg = "You are not fill properly";
                        bgColor = Colors.white;
                      });
                    }
                  },
                  child: Text('Calculate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
