import 'package:flutter/material.dart';
import 'package:skribbl/home_screen.dart';
import 'package:skribbl/socketconnect.dart';
// time spam: 1:05:56
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skribbl',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home_Screen(),
    );
  }
}
