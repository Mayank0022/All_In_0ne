import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Well Done🤟',
              style: TextStyle(
                fontSize: 40,
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'You Have Completed Todays Milestone',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "Don't Stop.\n Keep Drinking More Water",
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class AddSecondTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('You Have Completed Todays Milestone',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center),
            SizedBox(height: 20),
            Text('Come Back Tomorrow for new Milestone',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.amberAccent,
                ),
                textAlign: TextAlign.center),
            SizedBox(height: 20),
            Text(
              "Don't Stop.\n Keep Drinking More Water",
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
