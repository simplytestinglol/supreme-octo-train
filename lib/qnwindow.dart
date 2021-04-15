import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcet_app/questions.dart';
import 'package:kcet_app/resultscreen.dart';
import 'package:kcet_app/timer.dart';

class QnWindow extends StatefulWidget {
  @override
  QnWindowState createState() => QnWindowState();
}

class QnWindowState extends State<QnWindow> {
  int questionIdx = 0;
  var myTimer;
  void nextQuestion() {
    setState(() {
      if (questionIdx == 2) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultScreen()),
        );
      } else
        questionIdx++;
    });
  }

  @override
  Widget build(BuildContext context) {
    myTimer = MyTimer(this);
    return Container(
        child: Column(
      children: [
        Flexible(
          flex: 5,
          child: staticWindow(questionIdx, this),
        ),
        Flexible(child: myTimer)
        // Flexible(
        //   flex: 1,
        //   child: TextButton(
        //     style: ButtonStyle(
        //       foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        //     ),
        //     onPressed: () {
        //       setState(() {
        //         questionIdx = (questionIdx + 1) % 3;
        //       });
        //     },
        //     child: Text('TextButton'),
        //   ),
        // )
      ],
    ));
  }
}

staticWindow(int i, QnWindowState widget) {
  return Container(
    child: Column(
      children: [
        SizedBox(
          height: 120,
          child: Card(
              child: InkWell(
                  onTap: () {
                    print(Q.list_data[i]['question']);
                  },
                  child: Center(
                      child: Text(Q.list_data[i]['question'] ?? 'error ',
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.center)))),
        ),
        SizedBox(
          height: 25,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: Q.list_data.length + 1,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 100,
                  child: Card(
                      child: InkWell(
                          splashColor: (Q.list_data[i]["ans"] == index)
                              ? Colors.green
                              : Colors.red,
                          highlightColor: (Q.list_data[i]["ans"] == index)
                              ? Colors.green
                              : Colors.red,
                          onTap: () {
                            if (Q.list_data[i]["ans"] == index) Q.physics++;
                            MyTimer.running = false;
                            widget.nextQuestion();
                          },
                          child: Center(
                              child: Text(
                                  Q.list_data[i]["options"][index] ?? "error",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center)))),
                );
              }),
        ),
        SizedBox(
          height: 15,
        )
      ],
    ),
  );
}
