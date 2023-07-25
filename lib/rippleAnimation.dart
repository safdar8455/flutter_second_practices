import 'package:flutter/material.dart';

class rippleAnimation extends StatefulWidget {
  @override
  State<rippleAnimation> createState() => _rippleAnimation();
}

class _rippleAnimation extends State<rippleAnimation>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.addListener(() {
      setState(() {
        if (_animationController.status == AnimationStatus.completed) {
          radiusValue.removeAt(0);
          _animationController.reset();
        }
      });
    });
  }

  var radiusValue = [50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Ripple Animation')),
      ),
      body: Container(
        color: Colors.blue.shade400.withOpacity(0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: radiusValue
                    .map((radius) => Container(
                          width: radius * _animation.value,
                          height: radius * _animation.value,
                          decoration: BoxDecoration(
                            color:
                                Colors.blue.withOpacity(1.0 - _animation.value),
                            shape: BoxShape.circle,
                          ),
                        ))
                    .toList(),
              ),
              ElevatedButton(
                  onPressed: () {
                    _animationController.forward();
                  },
                  child: Text('Show')),
            ],
          ),
        ),
      ),
    );
  }
}
