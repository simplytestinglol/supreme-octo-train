// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:kcet_app/qnwindow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  var subjects = ["Mathematics", "Physics", "Chemistry"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      title: 'KCET Quiz App',
      home: Scaffold(
          appBar: AppBar(
            title: InkWell(
                onTap: () => print('hello'),
                child: Center(
                    child: Text('KCET Quiz App',
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center))),
            backgroundColor: Colors.pinkAccent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              for (var i = 0; i < 3; i++) getHomeScreenButton(i, context),
            ],
          )),
    );
  }

  getHomeScreenButton(int i, BuildContext context) {
    return (Expanded(
      child: Card(
          child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => QnWindow()),
                );
              },
              child: Center(
                  child: Text(subjects[i],
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center)))),
    ));
  }
}
