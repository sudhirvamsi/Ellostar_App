import 'package:ellostars/splash_screen.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ello stars',
      home: splash_screen(),
    );
  }
}
