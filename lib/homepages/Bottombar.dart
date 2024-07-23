import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ellostars/homepages/Homepage.dart';
import 'package:ellostars/pricelist_page.dart';
import 'package:ellostars/homepages/setting_page.dart';
import 'package:flutter/material.dart';

class Tabbar_screen extends StatefulWidget {
  Tabbar_screen({
    super.key,
  });

  @override
  State<Tabbar_screen> createState() => _home_pageState();
}

class _home_pageState extends State<Tabbar_screen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const homescreen(),
    const payouts_screen(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xfffff8f8),
        color: Color(0xfff85103),
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.currency_rupee,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
    );
  }
}
