import 'package:flutter/material.dart';

class tweenAnimation extends StatefulWidget {
  @override
  State<tweenAnimation> createState() => _tweenAnimationState();
}

class _tweenAnimationState extends State<tweenAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  late Animation animationColor;
  bool isIncrease = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animation = Tween<double>(begin: 0, end: 300).animate(_controller);
    animationColor =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(_controller);
    animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggling() {
    if (_controller.status == AnimationStatus.completed) {
      isIncrease = false;
      _controller.reverse();
    } else {
      isIncrease = true;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Tween Animation")),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: animation.value,
            height: animation.value,
            decoration: BoxDecoration(
              color: animationColor.value,
              borderRadius: BorderRadius.circular((animation.value) / 2),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                _toggling();
              },
              child: Text('Generate')),
        ],
      )),
    );
  }
}
