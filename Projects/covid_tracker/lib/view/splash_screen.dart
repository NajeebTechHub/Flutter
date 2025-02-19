import 'dart:async';

import 'package:covid_tracker/view/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late final controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)
    ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5),(){
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return const WorldStatesScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(100, 31, 32, 35),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: controller.value * 2 * math.pi,
                      child: child,
                    );
                  },
                  child: const Image(image: AssetImage('assets/images/virus.png')),
              ),
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * .08,),
              const Text('Covid-19\nTracker App', style: TextStyle(color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
