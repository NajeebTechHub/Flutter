import 'package:covid_tracker/services/StatesServices.dart';
import 'package:covid_tracker/view/countries_states.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen> with TickerProviderStateMixin{

  final states = StatesServices();
  late final controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(76, 76, 76, 76),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .06,),
            FutureBuilder(
                future: states.worldStatesApi(),
                builder: (context,snapshot){

                  if(!snapshot.hasData){
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 50,
                        controller: controller,
                      ),
                    );
                  }else{

                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          PieChart(
                            dataMap: {
                              'Total' : double.parse(snapshot.data!.cases.toString()),
                              'Recovered' : double.parse(snapshot.data!.recovered.toString()),
                              'Deaths' : double.parse(snapshot.data!.deaths.toString()),
                            },
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true
                            ),
                            legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left,
                              legendTextStyle: TextStyle(color: Colors.white),
                            ),
                            colorList: const [
                              Colors.blueAccent,
                              Colors.green,
                              Colors.red
                            ],
                            chartType: ChartType.ring,
                            chartRadius: MediaQuery.of(context).size.width / 3.2,
                            animationDuration: const Duration(milliseconds: 1200),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Card(
                              color: const Color.fromARGB(76, 76, 76, 76),
                              child: Column(
                                children: [
                                  ReusableRow(title: 'Total', value: snapshot.data!.cases.toString()),
                                  ReusableRow(title: 'Recovered', value: snapshot.data!.recovered.toString()),
                                  ReusableRow(title: 'Deaths', value: snapshot.data!.deaths.toString()),
                                  ReusableRow(title: 'Active', value: snapshot.data!.active.toString()),
                                  ReusableRow(title: 'Critical', value: snapshot.data!.critical.toString()),
                                  ReusableRow(title: 'Today Recovered', value: snapshot.data!.todayRecovered.toString()),
                                  ReusableRow(title: 'Today Deaths', value: snapshot.data!.todayDeaths.toString()),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                return const CountriesStatesScreen();
                              }));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * .9,
                              height: MediaQuery.of(context).size.height * .06,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: const Center(child: Text('Track Countries',style: TextStyle(color: Colors.white),)),
                            ),
                          )

                        ],
                      ),
                    );
                  }
                }),

          ],
        ),
      ),
    );
  }
}


class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: const TextStyle(color: Colors.white),),
              Text(value,style: const TextStyle(color: Colors.white),)
            ],
          ),
          const Divider(color: Colors.black26,)
        ],
      ),
    );
  }
}

