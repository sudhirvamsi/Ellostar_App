import 'package:ellostars/silver_packages_list/month_3.dart';
import 'package:ellostars/silver_packages_list/month_6.dart';
import 'package:ellostars/silver_packages_list/year1.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class silver_packages extends StatefulWidget {
  const silver_packages({super.key});

  @override
  State<silver_packages> createState() => _silver_packagesState();
}

class _silver_packagesState extends State<silver_packages> {

  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (
      Stack(
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
              child: SmoothPageIndicator(controller: _controller, count: 3,
              effect: WormEffect(
                dotColor: Colors.blue.shade100,
                activeDotColor: Colors.blue
              ),)),

        ],
      )
      ),
    );
  }
}
