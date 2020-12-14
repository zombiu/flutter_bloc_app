import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/bloc/count/count_home.dart';
import 'package:flutter_bloc_app/cubit/counter/counter_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLOC Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CounterHome(),
    );
  }
}
