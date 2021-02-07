import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'breathly.dart';
import 'package:breath_meter/Components/TopDesign.dart';

void main() async => runApp(BreathStart());

class BreathStart extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
            backgroundColor: Colors.white,
            body: HomePage()
        )
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final theImage=AssetImage('assets/undraw_Meditating_re_aiqa.png');


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
            height: MediaQuery.of(context).size.height/3.5,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(100, 255, 200, 0.8),
          ),
        ),
        Container(
          child: Image(
              image:theImage
          ),
        ),
        // SizedBox(
        //   height: 30,
        // ),
        Text('Just Relax And Meditate.',
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width/14,
              fontWeight: FontWeight.bold,
              color: Color(0xff40B3A2),
          ),
        ),
        // SizedBox(
        //   height: 50,
        // ),

        RaisedButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Breath()));
          },
          textColor: Colors.white,
          padding: EdgeInsets.all(0.0),
          child: Container(
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(64, 179, 162, 1),
                  Color.fromRGBO(64, 179, 162, 0.7),
                  Color.fromRGBO(64, 179, 162, 0.4),
                ],
              ),
            ),
            padding: EdgeInsets.all(10.0),
            child: Text('Click To Calculate', style: TextStyle(
                fontSize: MediaQuery.of(context).size.width/18,
                color:Colors.white,
            ),
            ),
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }
}



