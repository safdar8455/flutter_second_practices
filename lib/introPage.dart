import 'package:flutter/material.dart';
import 'package:secondapp/main.dart';

class introPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Intro'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              SizedBox(
                height: 11,
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45)),
                    hintText: 'Enter Name',
                  ),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyHomePage(nameController.text.toString())));
                  },
                  child: Text('Next')),
            ],
          ),
        ));
  }
}
