import 'package:flutter/material.dart';

class DiseaseScreen extends StatelessWidget {
  const DiseaseScreen({super.key, required this.result});
  final List<dynamic>? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child:
              result != null ? Text(result![0]['label']) : const Text('data')),
    );
  }
}
