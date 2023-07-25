import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class shared_Preferences extends StatefulWidget {
  @override
  State<shared_Preferences> createState() => _shared_Preferences();
}

class _shared_Preferences extends State<shared_Preferences> {
  var result = "";
  var textController = TextEditingController();

  void getFieldValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nameValue = prefs.getString('name');
    result = nameValue ?? 'Value is not Saved';
    setState(() {});
  }

  @override
  void initState() {
    getFieldValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Shared Preferences')),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red.shade100,
        child: Center(
            child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: textController,
                      decoration: InputDecoration(
                          label: Text('Name'),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.red))),
                    ),
                    SizedBox(height: 11),
                    ElevatedButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString(
                              'name', textController.text.toString());
                          setState(() {
                            getFieldValue();
                          });
                        },
                        child: Text('Save')),
                    SizedBox(height: 11),
                    Text(result, style: TextStyle(fontSize: 18)),
                  ],
                ))),
      ),
    );
  }
}
