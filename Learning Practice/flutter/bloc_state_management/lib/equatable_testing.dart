// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:equatable/equatable.dart';
//
// class EquatableTesting extends StatefulWidget {
//   const EquatableTesting({super.key});
//
//   @override
//   State<EquatableTesting> createState() => _EquatableTestingState();
// }
//
// class _EquatableTestingState extends State<EquatableTesting> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//           onPressed: (){
//             final p1 = Person(name: 'najeeb', age: 24);
//             final p2 = Person(name: 'najeeb', age: 24);
//
//             print(p1 == p2);
//             print(p1.hashCode.toString() == p2.hashCode.toString());
//
//             print(p1.hashCode.toString());
//             print(p2.hashCode.toString());
//           }
//       ),
//     );
//   }
// }
//
// class Person extends Equatable{
//
//   final String name;
//   final int age;
//
//   Person({required this.name,required this.age});
//
//   @override
//   List<Object?> get props => [name, age];
//
// }
