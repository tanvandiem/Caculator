import 'package:flutter/material.dart';
import 'package:my_caculator/caculator.dart';
import 'package:my_caculator/caculator_provider.dart';

import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: const MaterialApp(
        // theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: MyCalculator(),
      ),
    );

      }

  }
