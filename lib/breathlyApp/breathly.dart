import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:breath_meter/Components/TopDesign.dart';

class Breath extends StatefulWidget {
  @override
  _BreathState createState() => _BreathState();
}

class _BreathState extends State<Breath> {
  final _stopWatchTimer = StopWatchTimer();
  double percent = 0.0;

  String msg = "";
  void message(int value) {
    setState(() {});
    if (value == -99) {
      msg = "Keep Holding The fingerprint";
    } else {
      if (value == 0) {
        msg = "Hold the fingerprint to start";
      } else if (value > 0 && value < 30) {
        msg = "Common You Can Do Better";
      } else if (value >= 30 && value < 60) {
        msg = "You are good";
      } else if (value >= 60 && value < 90) {
        msg = "You are great at this";
      } else if (value >= 90 && value < 120) {
        msg = "You are Better than 98% People";
      } else {
        msg = "You lungs are in perfect\nCondition";
      }
    }
  }

  /// message function

  static const IconData fingerprint =
      IconData(0xe74a, fontFamily: 'MaterialIcons');
  @override
  void initState() {
    super.initState();
    message(0);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipPath(
              clipper: TopDesign(),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.4,
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(64, 179, 162, 0.8),
              ),
            ),

            StreamBuilder<int>(
              stream: _stopWatchTimer.secondTime,
              initialData: _stopWatchTimer.secondTime.value,
              builder: (context, snap) {
                final value = snap.data;
                return Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularStepProgressIndicator(
                        totalSteps: 60,
                        currentStep: value % 60,
                        selectedColor: Colors.redAccent,
                        unselectedColor: Colors.grey[200],
                        selectedStepSize: 15.0,
                        width: 200,
                        height: 200,
                        gradientColor: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.lightBlueAccent,
                            Colors.orangeAccent,
                            Colors.deepPurpleAccent,
                            Colors.yellowAccent,
                            Colors.redAccent
                          ],
                        ),
                        child: Center(
                            child: Text('$value',
                                style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 40,
                                ))),
                      ),
                      Row(
                        children: [
                          Text(" +",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black54,
                              )),
                          Text((value ~/ 60).toString(),
                              style: TextStyle(
                                fontSize: 60,
                                color: Colors.black,
                              )),
                          Text('min',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black54)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

            /// Button
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: GestureDetector(
                      onTapDown: (void no) async {
                        _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                        message(-99);
                      },
                      onTapUp: (void no) async {
                        _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                        message(_stopWatchTimer.secondTime.value);
                      },
                      onLongPressEnd: (void no) async {
                        _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                        message(_stopWatchTimer.secondTime.value);
                      },
                      child: Icon(fingerprint,
                          size: 120, color: Colors.tealAccent),
                    ),
                  ),
                  SizedBox(width: 10),
                  RaisedButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                    color: Colors.red,
                    shape: const StadiumBorder(),
                    onPressed: () async {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                      message(0);
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    msg,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            )

            // FlatButton(
            //             minWidth: MediaQuery.of(context).size.width,
            //               onPressed: (){
            //             Navigator.pop(context);
            //           },
            //               child: Icon(Icons.home,
            //                 size: 50,
            //                 color: Colors.blue,
            //               )),
          ],
        ),
      ),
    );
  }
}
