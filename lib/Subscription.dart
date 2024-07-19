import 'package:flutter/material.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  List<Map<String, dynamic>> _data = [
    {'serial': 1, 'date': '05 Jul, 2024', 'amount': '100', 'mahesh': 'done'},
    {'serial': 2, 'date': '06 Jul, 2024', 'amount': '200', 'mahesh': 'pending'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payouts'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Table(
            columnWidths: {
              0: FixedColumnWidth(50), // Width for S.no column
              1: FixedColumnWidth(150), // Width for Date column
              2: FixedColumnWidth(100), // Width for Amount column
              3: FixedColumnWidth(100), // Width for Status column
              4: FixedColumnWidth(100), // Width for Action column
            },
            border: TableBorder.all(),
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.grey[300]),
                children: [
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('S.no',
                              style: TextStyle(fontWeight: FontWeight.bold)))),
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Date',
                              style: TextStyle(fontWeight: FontWeight.bold)))),
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Amount',
                              style: TextStyle(fontWeight: FontWeight.bold)))),
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Status',
                              style: TextStyle(fontWeight: FontWeight.bold)))),
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Action',
                              style: TextStyle(fontWeight: FontWeight.bold)))),
                ],
              ),
              ..._data.map((item) {
                return TableRow(children: [
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(item['serial'].toString()))),
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(item['date']))),
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(item['amount'].toString()))),
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(item['mahesh']))),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () {
                          // Your action here
                          print('Button pressed for serial: ${item['serial']}');
                        },
                        child: Text('Action'),
                      ),
                    ),
                  ),
                ]);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
