import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Add_Task_Screen.dart';
import 'package:breath_meter/Components/TopDesign.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var value = 0;
  _saveValue(int val) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('value', val);
    setState(() {
      value = prefs.getInt('value');
    });
  }

  _getValue() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      value = prefs.getInt('value');
    });
  }

  @override
  void initState() {
    super.initState();
    print("started");
    _saveValue(0);
    _getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipPath(
            clipper: TopDesign(),
            child: Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.lightBlueAccent.shade100,
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.8,
              height: MediaQuery.of(context).size.width / 1.8,
              child: LiquidCircularProgressIndicator(
                value: value / 3000, // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(Colors
                    .lightBlueAccent), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors
                    .lightBlue, // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.lightBlueAccent.shade700,
                borderWidth: 5.0,
                direction: Axis.vertical,
                center: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$value",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          fontSize: 35),
                    ),
                    Text(
                      "ml",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          fontSize: 25),
                    ),
                  ],
                ), // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
              ),
            ),
          ),
          RaisedButton(
            padding: EdgeInsets.only(top: 5, right: 10),
            color: Colors.lightBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '🥛',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  '+300ml',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white60,
                  ),
                )
              ],
            ),
            onPressed: () {
              if (value >= 3000) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddSecondTaskScreen(),
                    ),
                  ),
                );
              } else {
                //(value + 300);
                if (value == 2700) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AddTaskScreen(),
                      ),
                    ),
                  );
                }
                _saveValue(value + 300);
              }
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.lightBlueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // FlatButton(
                //     color: Colors.lightBlueAccent,
                //   onPressed: (){
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => AlarmPage()));
                //   },
                //     child: Icon(Icons.alarm,color: Colors.white,size: 35),
                // ),
                FlatButton(
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.home, color: Colors.white, size: 35),
                ),
                // FlatButton(
                //     color: Colors.lightBlueAccent,
                //   onPressed: (){
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => SettingPage()));
                //   },
                //     child: Icon(Icons.settings,color: Colors.white,size: 35),
                // ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
