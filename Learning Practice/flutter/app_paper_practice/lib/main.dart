import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(PaperPractice());
}

class PaperPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double x = 0.0, y = 0.0, z = 0.0;
  double a = 0.0, b = 0.0, c = 0.0;

  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  StreamSubscription<GyroscopeEvent>? _gyroscopeSubscription;

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription = accelerometerEventStream().listen((AccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });

    _gyroscopeSubscription = gyroscopeEventStream().listen((GyroscopeEvent event) {
      setState(() {
        a = event.x;
        b = event.y;
        c = event.z;
      });
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    _gyroscopeSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Paper Practice'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('This is SnackBar')),
                );
              },
              child: Text('Show SnackBar')),
          ElevatedButton(onPressed: showAlert, child: Text('Alert Dialog')),
          ElevatedButton(onPressed: simple, child: Text('Languages')),
          ElevatedButton(onPressed: bottom, child: Text('Bottom Sheet')),
          ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: 'Successfully added',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.black,
                    textColor: Colors.white);
              },
              child: Text('Show Toast')),
          GestureDetector(
            child: Text('Gesture Detector'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Gesture Tap')),
              );
            },
            onDoubleTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Gesture Double Tap')),
              );
            },
            onScaleUpdate: (details) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Gesture Scale Update')));
            },
            onVerticalDragUpdate: (details) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Gesture Vertical Drag')));
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Accelerometer Data: x = $x, y = $y, z = $z'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Gyroscope Data: x = $a, y = $b, z = $c'),
          ),
        ],
      ),
    );
  }

  void showAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Alert dialog'),
            content: Text('This is for confirmation'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'))
            ],
          );
        });
  }

  void simple() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Select a language'),
            children: [
              SimpleDialogOption(
                child: Text('English'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('English selected')));
                  Navigator.of(context).pop();
                },
              ),
              SimpleDialogOption(
                child: Text('Urdu'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Urdu selected')));
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void bottom() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Center(
              child: Text('This is a modal bottom sheet'),
            ),
          );
        });
  }
}
