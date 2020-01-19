import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SleekCircularSlider(
          innerWidget: (value) {
            if (double.parse(value.toStringAsFixed(0)) <= 20) {
              return Padding(
                padding: const EdgeInsets.all(60),
                child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue[100],
                            blurRadius:
                                20.0, // has the effect of softening the shadow
                            spreadRadius:
                                7.0, // has the effect of extending the shadow
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Icon(
                      Icons.scanner,
                      size: 60,
                    )),
              );
            }
            if (double.parse(value.toStringAsFixed(0)) > 20 &&
                double.parse(value.toStringAsFixed(0)) < 40) {
              return Icon(
                Icons.verified_user,
                size: 60,
              );
            }
            if (double.parse(value.toStringAsFixed(0)) > 40 &&
                double.parse(value.toStringAsFixed(0)) < 60) {
              return Icon(
                Icons.access_alarm,
                size: 60,
              );
            }
            if (double.parse(value.toStringAsFixed(0)) > 60 &&
                double.parse(value.toStringAsFixed(0)) < 100) {
              return Icon(
                Icons.navigation,
                size: 60,
              );
            }
          },
          onChange: (value) {
            print(value);
          },
          appearance: CircularSliderAppearance(
              size: 300,
              angleRange: 360,
              customColors: CustomSliderColors(
                  trackColor: Colors.blue[200],
                  shadowColor: Colors.blueGrey[200],
                  shadowMaxOpacity: 0.1,
                  progressBarColors: [
                    Colors.blue,
                    Colors.lightBlue,
                    Colors.lightBlueAccent
                  ]),
              customWidths: CustomSliderWidths(
                  trackWidth: 10, shadowWidth: 80, progressBarWidth: 30)),
          min: 20,
          max: 27,
          initialValue: 20,
        ),
      ),
    );
  }
}
