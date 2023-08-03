import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'TapBattelApps.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        textTheme: Theme.of(context).textTheme.apply(displayColor: Colors.red),
      ),
      home: GameTapScreen(),
    );
  }
}


