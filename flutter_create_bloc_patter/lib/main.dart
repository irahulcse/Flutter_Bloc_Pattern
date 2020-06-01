import 'package:flutter/material.dart';
import 'package:flutter_create_bloc_patter/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
