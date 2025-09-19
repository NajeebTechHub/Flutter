import 'package:bloc_state_management/bloc/counter/counter_bloc.dart';
import 'package:bloc_state_management/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_state_management/ui/counter_bloc/counter_screen.dart';
import 'package:bloc_state_management/ui/switch_example/switch_example_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => SwitchBloc())
        ], 
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SwitchExampleScreen(),
    ),
    );
  }
}
