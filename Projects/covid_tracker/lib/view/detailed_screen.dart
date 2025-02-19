import 'package:covid_tracker/view/world_states.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  final String name, image;
  final int cases,
      recovered,
      deaths,
      active,
      critical,
      todayCases,
      todayRecovered,
      todayDeaths;

  const DetailedScreen({
    super.key,
    required this.image,
    required this.name,
    required this.cases,
    required this.recovered,
    required this.deaths,
    required this.active,
    required this.critical,
    required this.todayCases,
    required this.todayRecovered,
    required this.todayDeaths,
  });

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(100, 31, 32, 35),
      appBar: AppBar(
        title: Text(widget.name,style: const TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(100, 31, 32, 35),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Card(
                    color: const Color.fromARGB(76, 76, 76, 76),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Column(
                          children: [
                            ReusableRow(title: 'Total Cases', value: widget.cases.toString()),
                            ReusableRow(title: 'Total Recovered', value: widget.recovered.toString()),
                            ReusableRow(title: 'Total Deaths', value: widget.deaths.toString()),
                            ReusableRow(title: 'Active', value: widget.active.toString()),
                            ReusableRow(title: 'Critical', value: widget.critical.toString()),
                            ReusableRow(title: 'Today Cases', value: widget.todayCases.toString()),
                            ReusableRow(title: 'Today Recovered', value: widget.todayRecovered.toString()),
                            ReusableRow(title: 'Today Deaths', value: widget.todayDeaths.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
