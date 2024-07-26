import 'package:ellostars/homepages/gold_packages.dart';
import 'package:ellostars/homepages/silver_package.dart';

import 'package:flutter/material.dart';

class packagesList extends StatefulWidget {
  final String serviceId;
  final String subServiceId;
  const packagesList({
    super.key,
    required this.serviceId,
    required this.subServiceId,
  });

  @override
  State<packagesList> createState() => _packagesList();
}

class _packagesList extends State<packagesList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'OUR PACKAGES',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue.shade700,
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                height: 100,
                child: Text(
                  'Silver Packages',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                height: 100,
                child: Text(
                  'Gold Packages',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              height: 450,
              width: 300,
              child: SilverPackages(
                subid: widget.subServiceId,
                id: widget.serviceId,
              ),
            ),
            Container(
              color: Colors.lightBlueAccent,
              child: (const GoldPackages()),
            ),
          ],
        ),
      ),
    );
  }
}
