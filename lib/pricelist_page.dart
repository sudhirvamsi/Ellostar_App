import 'package:flutter/material.dart';

class PriceListPages extends StatelessWidget {
  const PriceListPages({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'priceList',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: Colors.orange[50],
      body: Center(
        child: Text('we are implement this page'),
      ),
    );
  }
}
