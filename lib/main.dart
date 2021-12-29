import 'package:flutter/material.dart';
import 'delayed_animation.dart';
import 'welcome_page.dart';
const d_red = const Color(0xFFE9717D);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga App',
      debugShowCheckedModeBanner: false,
      home:WelcomePage()
    );
  }
}
