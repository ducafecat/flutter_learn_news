import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/pages/welcome/welcomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
