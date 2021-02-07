import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'breathlyApp/main.dart';
import 'bmi/main.dart';
import 'water_drinker/main.dart';
import 'Components/TopDesign.dart';
import 'package:cron/cron.dart';
import 'water_drinker/notificationManager.dart';
import 'water_drinker/result_page.dart';

void main() async {
  cron();
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(MyApp());
}

void cron() {
  var cron = new Cron();
  cron.schedule(new Schedule.parse('13 11 * * *'), () async {
    print("hello");
    updateWaterData();
  });
  cron.schedule(new Schedule.parse('10 0 * * *'), () async {
    updateWaterData();
  });
  cron.schedule(new Schedule.parse('0 6 * * *'), () async {
    scheduleNotification();
  });
  cron.schedule(new Schedule.parse('0 18 * * *'), () async {
    scheduleNotification();
  });
}

void updateWaterData() {
  AndroidAlarmManager.oneShotAt(DateTime.now(), 1, updateValue,
      exact: true,
      allowWhileIdle: true,
      wakeup: true,
      rescheduleOnReboot: true,
      alarmClock: true);
}

void updateValue() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Home(),
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: TopDesign(),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        Colors.yellow,
                        Colors.yellow,
                        Colors.yellow,
                        Colors.yellow,
                      ],
                    ),
                  ),
                ),
              ),
              ClipPath(
                clipper: TopDesign(),
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        Colors.yellowAccent,
                        Colors.yellowAccent[200],
                        Colors.yellowAccent[100],
                        Colors.yellowAccent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Fitrev App',
            style: TextStyle(
              fontSize: 70,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BreathStart()));
            },
            iconSize: MediaQuery.of(context).size.width / 2.7,
            icon: Image.asset('assets/lungs.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Colors.grey[100],
                      Colors.grey[100],
                      Colors.grey[200],
                      Colors.grey[300],
                    ],
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BMICalculator()));
                  },
                  iconSize: MediaQuery.of(context).size.width / 3.4,
                  icon: Image.asset('assets/body-mass.png'),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Colors.blue[50],
                      Colors.blue[100],
                      Colors.blue[200],
                      Colors.blue[300],
                    ],
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Water()));
                  },
                  iconSize: MediaQuery.of(context).size.width / 3.4,
                  icon: Image.asset('assets/glass-of-water.png'),
                ),
              ),
            ],
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
