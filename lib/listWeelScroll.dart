import 'package:flutter/material.dart';

class listWeelScroll extends StatelessWidget {
  List<String> names = [
    'Safdar',
    'Safia',
    'Akhtar',
    'Sheheryar',
    'Muzaffar',
    'Shafak',
    'Kashaf'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('List Weel Scroll')),
      ),
      body: Container(
        child: ListWheelScrollView(
            itemExtent: 200,
            children: names
                .map((value) => Container(
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        value,
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
