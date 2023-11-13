import 'package:flutter/material.dart';
import 'package:plant_disease_detector/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Disease Detector',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
          //     .copyWith(secondary: Colors.greenAccent),
          useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
