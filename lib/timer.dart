import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tabu_game/point_screen.dart';

class TimeCounter extends StatefulWidget {
  @override
  _TimeCounterState createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  int _counter = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PointsPage()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_counter seconds',
      style: TextStyle(fontSize: 24.0),
    );
  }
}
