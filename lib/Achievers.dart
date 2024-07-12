import 'package:flutter/material.dart';

class Archivers_screen extends StatelessWidget {
  const Archivers_screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'priceList',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Text('we are implement this page'),
      ),
    );
  }
}
