import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(

      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              //width: MediaQuery.of(context).size.width,
              color: Colors.lightBlue,
            )
          ],
        ),
      ),
    );
  }
}
