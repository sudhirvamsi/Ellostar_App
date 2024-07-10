import 'package:flutter/material.dart';

class PriceListPages extends StatelessWidget {
  const PriceListPages({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(),
        ),
      ),
      body: Center(
        child: Text('we are implement this page'),
      ),
    );
  }
}
