import 'package:ellostars/gold_packages_list/month_3.dart';
import 'package:ellostars/gold_packages_list/month_6.dart';
import 'package:ellostars/gold_packages_list/year_1.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class gold_packages extends StatefulWidget {
  const gold_packages({super.key});

  @override
  State<gold_packages> createState() => _gold_packagesState();
}

class _gold_packagesState extends State<gold_packages> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              month_3(),
              month_6(),
              year_1(),
            ],
          ),
          Container(
            alignment: Alignment(0,0.9),
            child: (
            SmoothPageIndicator(controller:_controller ,count: 3,
            effect: WormEffect(
              dotColor: Colors.orange.shade200,
              activeDotColor: Colors.orange
            ),)),
          )
        ],
      )
    );
  }
}
