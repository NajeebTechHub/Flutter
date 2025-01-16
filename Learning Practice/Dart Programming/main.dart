import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "";
  TextEditingController tcName = TextEditingController(text: "Ali");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello App"),
            TextField(controller: tcName,),
            ElevatedButton(onPressed: show, child: Text("OK")),
            Text(name)
          ],
        ),
      )



    );
  }

  void show() {
    print(tcName.text);
    name = "Hello " + tcName.text;
    setState(() {

    });
  }
}
