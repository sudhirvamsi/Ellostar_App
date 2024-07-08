import 'package:flutter/material.dart';
class packages_tabs extends StatelessWidget {

  final String title;


  const packages_tabs({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),

        ],


      ),
    );
  }
}
