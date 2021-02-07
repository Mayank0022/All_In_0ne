import 'package:flutter/material.dart';


class TopDesign extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width/275 ;
    final double _yScaling = size.height/140 ;
    path.lineTo(0 * _xScaling,0 * _yScaling);
    path.cubicTo(0 * _xScaling,0 * _yScaling,278 * _xScaling,0 * _yScaling,278 * _xScaling,0 * _yScaling,);
    path.cubicTo(278 * _xScaling,0 * _yScaling,278 * _xScaling,120 * _yScaling,278 * _xScaling,120 * _yScaling,);
    path.cubicTo(278 * _xScaling,120 * _yScaling,245.308 * _xScaling,126.935 * _yScaling,245.308 * _xScaling,126.935 * _yScaling,);
    path.cubicTo(245.103 * _xScaling,126.978 * _yScaling,244.905 * _xScaling,127.022 * _yScaling,244.7 * _xScaling,127.066 * _yScaling,);
    path.cubicTo(241.962 * _xScaling,127.657 * _yScaling,221.167 * _xScaling,131.897 * _yScaling,209 * _xScaling,127 * _yScaling,);
    path.cubicTo(192.811 * _xScaling,120.484 * _yScaling,195.279 * _xScaling,101.433 * _yScaling,180 * _xScaling,93 * _yScaling,);
    path.cubicTo(164.139 * _xScaling,84.2456 * _yScaling,150.994 * _xScaling,80.7219 * _yScaling,134 * _xScaling,87 * _yScaling,);
    path.cubicTo(121.523 * _xScaling,91.6093 * _yScaling,119.616 * _xScaling,102.522 * _yScaling,108 * _xScaling,109 * _yScaling,);
    path.cubicTo(94.8344 * _xScaling,116.342 * _yScaling,85.9445 * _xScaling,121.975 * _yScaling,71 * _xScaling,120 * _yScaling,);
    path.cubicTo(56.5917 * _xScaling,118.096 * _yScaling,49.2993 * _xScaling,111.599 * _yScaling,35 * _xScaling,109 * _yScaling,);
    path.cubicTo(19.703 * _xScaling,106.22 * _yScaling,0 * _xScaling,120 * _yScaling,0 * _xScaling,120 * _yScaling,);
    path.cubicTo(0 * _xScaling,120 * _yScaling,0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,);
    path.cubicTo(0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip( CustomClipper<Path> oldClipper) => true;

}