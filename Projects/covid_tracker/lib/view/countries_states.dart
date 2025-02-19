import 'package:covid_tracker/services/StatesServices.dart';
import 'package:covid_tracker/view/detailed_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesStatesScreen extends StatefulWidget {
  const CountriesStatesScreen({super.key});

  @override
  State<CountriesStatesScreen> createState() => _CountriesStatesScreenState();
}

class _CountriesStatesScreenState extends State<CountriesStatesScreen> {

  final states = StatesServices();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(100, 31, 32, 35),
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),
      backgroundColor: const Color.fromARGB(100, 31, 32, 35),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value){
                setState(() {

                });
              },
              style: const TextStyle(color: Colors.white),
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: 'search country here',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
                )
              ),
            ),
            FutureBuilder(
                future: states.countriesStatesApi(),
                builder: (context,snapshot){

                  if(!snapshot.hasData){
                      return Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context,index){
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(height: 50,width: 50,color: Colors.white,),
                                    title: Container(height: 10,width: 89,color: Colors.white,),
                                    subtitle: Container(height: 10,width: 89,color: Colors.white,),
                                  ),
                                ],
                              ),
                                );
                        
                        
                          }),
                      );
                  }else{
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){
                            
                            String name = snapshot.data![index]['country'];

                            if(searchController.text.isEmpty){
                              return InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                    return DetailedScreen(
                                      image: snapshot.data![index]['countryInfo']['flag'] ?? '',
                                      name: snapshot.data![index]['country'] ?? '',
                                      cases: snapshot.data![index]['cases'] ?? 0,
                                      recovered: snapshot.data![index]['recovered'] ?? 0,
                                      deaths: snapshot.data![index]['deaths'] ?? 0,
                                      active: snapshot.data![index]['active'] ?? 0,
                                      critical: snapshot.data![index]['critical'] ?? 0,
                                      todayCases: snapshot.data![index]['todayCases'] ?? 0,
                                      todayRecovered: snapshot.data![index]['todayRecovered'] ?? 0,
                                      todayDeaths: snapshot.data![index]['todayDeaths'] ?? 0,

                                    );
                                  }));
                                },
                                child: ListTile(
                                  leading: Image(
                                    width: 50,
                                    height: 50,
                                    image: NetworkImage(snapshot.data![index]['countryInfo']['flag']),
                                  ),
                                  title: Text(snapshot.data![index]['country'],style: const TextStyle(color: Colors.white),),
                                  subtitle: Text('cases : ${snapshot.data![index]['cases']}'),
                                ),
                              );
                            }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                              return InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                    return DetailedScreen(
                                      image: snapshot.data![index]['countryInfo']['flag'] ?? '',
                                      name: snapshot.data![index]['country'] ?? '',
                                      cases: snapshot.data![index]['cases'] ?? 0,
                                      recovered: snapshot.data![index]['recovered'] ?? 0,
                                      deaths: snapshot.data![index]['deaths'] ?? 0,
                                      active: snapshot.data![index]['active'] ?? 0,
                                      critical: snapshot.data![index]['critical'] ?? 0,
                                      todayCases: snapshot.data![index]['todayCases'] ?? 0,
                                      todayRecovered: snapshot.data![index]['todayRecovered'] ?? 0,
                                      todayDeaths: snapshot.data![index]['todayDeaths'] ?? 0,

                                    );
                                  }));
                                },
                                child: ListTile(
                                  leading: Image(
                                    width: 50,
                                    height: 50,
                                    image: NetworkImage(snapshot.data![index]['countryInfo']['flag']),
                                  ),
                                  title: Text(snapshot.data![index]['country'],style: const TextStyle(color: Colors.white),),
                                  subtitle: Text('cases : ${snapshot.data![index]['cases']}'),
                                ),
                              );
                            }else{
                              return Container();
                            }
                            
                          }),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
