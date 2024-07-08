import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ellostars/main_screen.dart';
import 'package:flutter/material.dart';
class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.orange.shade50,
        color: Colors.orange.shade500,
        animationDuration: Duration(milliseconds: 300),
        items: [
        Icon(Icons.home,
        color: Colors.white,
        ),
          Icon(Icons.shopping_cart_sharp,
            color: Colors.white,
          ),

          Icon(Icons.settings,
            color: Colors.white,
          ),


      ],),

      body: main_screen(),

    );
  }
}
