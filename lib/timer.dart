import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcet_app/qnwindow.dart';

// var precision = 500;
// var target = 60;

class MyTimer extends StatefulWidget {
  static int time;
  static bool running;
  // static Timer timer;
  QnWindowState widget;
  MyTimer(State<QnWindow> widget) {
    this.widget = widget;
    time = 0;
    running = true;
  }

  @override
  _MyTimerState createState() => _MyTimerState(this);
}

class _MyTimerState extends State<MyTimer> {
  MyTimer myTimer;
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  _MyTimerState(MyTimer myTimer) {
    this.myTimer = myTimer;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (MyTimer.time == 60) {
        timer.cancel();
        myTimer.widget.nextQuestion();
      } else if (MyTimer.running)
        setState(() {
          MyTimer.time++;
        });
      else
        timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.blue,
      value: MyTimer.time / 60,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
    );
  }
}
