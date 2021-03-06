import 'package:example_flutter_nodejs/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Node Server Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
