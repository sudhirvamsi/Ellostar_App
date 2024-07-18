import 'package:flutter/material.dart';

class PriceListPages extends StatelessWidget {
  const PriceListPages({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'priceList',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Text('we are implement this page'),
      ),
    );
  }
}
