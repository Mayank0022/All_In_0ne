import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:breath_meter/water_drinker/result_page.dart';
import 'package:breath_meter/Components/TopDesign.dart';
//import 'notificationManager.dart';

class Water extends StatefulWidget {
  @override
  _WaterState createState() => _WaterState();
}

class _WaterState extends State<Water> {
  // @override
  // void dispose() {
  //   super.dispose();
  //   scheduleNotification();
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(backgroundColor: Colors.white, body: HomePage()));
  }
}

final kNeumorphicColor = Colors.lightBlueAccent.shade100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final theImage = AssetImage('assets/11024-min.jpg');

  @override
  void didChangeDependencies() {
    precacheImage(theImage, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Container(
          child: Image(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
              image: theImage),
        ),
        Text(
          'Keep Your Body Hydrate.',
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 14.5,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ResultPage()));
          },
          textColor: Colors.white,
          padding: EdgeInsets.all(0.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  // Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                  Colors.lightBlueAccent,
                ],
              ),
            ),
            padding: EdgeInsets.all(10.0),
            child: Text('Click To Calculate',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 18)),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
