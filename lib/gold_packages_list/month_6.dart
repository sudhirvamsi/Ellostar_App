import 'package:flutter/material.dart';

class month_6 extends StatelessWidget {
  const month_6({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Container(
                width: 400,
                height: 500,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '6 Months',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const Text('The quality of output we provide is PREMIUM'),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            '₹\ 3,60,000',
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 1.5),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange.shade100),
                            child: (const Text(
                              'SAVE 8.3%',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 14),
                            )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Column(
                        children: [
                          Text(
                            'Rs 3,30,000/- + 18% GST',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            '₹',
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '3,89,400',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '/-',
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange),
                        child: const Center(
                            child: Text(
                          'Choose plan',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                            color: Colors.grey[700],
                            thickness: 1,
                          )),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'What You Get',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            color: Colors.grey[700],
                            thickness: 1,
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.orange[700],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            '120 Slides',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          const Text(' will be provided throughout the tenure'),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.orange[700],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            '30 Reels',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          const Text(' will be provided throughout the tenure'),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.orange[700],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Platforms Handled:',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                          ),
                          Text('Facebook, Instagram, YouTube, '
                              'Google My Business')
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.orange[700],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Content Management',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                          ),
                          Text('Dedicated CRM, Reputation Management, '
                              'Campaign Management')
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.orange[700],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Page Monitoring Manager, Monthly Report'),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange[100]),
                        child: const Center(
                          child: Text(
                              "Ellostar's commission is 10% = Rs 33,000/- "),
                        ),
                      )
                    ],
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
