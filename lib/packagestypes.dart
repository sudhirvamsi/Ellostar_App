import 'package:ellostars/gold_packages.dart';
import 'package:ellostars/silver_package.dart';
import 'package:ellostars/subsirvices_details.dart';
import 'package:flutter/material.dart';

class smo_packages extends StatefulWidget {
  const smo_packages({super.key});

  @override
  State<smo_packages> createState() => _smo_packagesState();
}

class _smo_packagesState extends State<smo_packages> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
        body: Expanded(
          child: TabBarView(
            children: [
              Container(
                height: 450,
                width: 300,
                child: SilverPackages(),
              ),
              Container(
                color: Colors.lightBlueAccent,
                child: (const gold_packages()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
