import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

var value = 0;

class CustomProgressIndicator extends StatefulWidget {
  CustomProgressIndicator(this.value);
  final value;
  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return LiquidCircularProgressIndicator(
      value: widget.value / 3000, // Defaults to 0.5.
      valueColor: AlwaysStoppedAnimation(Colors
          .lightBlueAccent), // Defaults to the current Theme's accentColor.
      backgroundColor:
          Colors.lightBlue, // Defaults to the current Theme's backgroundColor.
      borderColor: Colors.lightBlueAccent.shade700,
      borderWidth: 5.0,
      direction: Axis.vertical,
      center: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (widget.value).toString(),
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: 35),
          ),
          Text(
            "ml",
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.9), fontSize: 25),
          ),
        ],
      ), // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
    );
  }
}
