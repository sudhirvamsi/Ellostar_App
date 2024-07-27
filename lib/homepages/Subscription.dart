import 'dart:convert';

import 'package:ellostars/homepages/Subscription_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  List<Map<String, dynamic>> _data = [];
  DateTime selectedDate = DateTime(2024);
  String formattedDateTime = '';

  @override
  void initState() {
    getSubscriptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Payouts',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      backgroundColor: Color(0xffFFF5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            TextFormField(
              controller: TextEditingController(
                text: "$formattedDateTime",
              ),
              readOnly: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: 'Event Date',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                suffixIcon: IconButton(
                  color: Colors.orange,
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDateTime(context),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade400),
                ),
              ),
              onTap: () => _selectDateTime(context),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select Event Date & Time';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Please select date for you want Services list',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: SingleChildScrollView(
                // scrollDirection: Axis.horizontal,
                child: Expanded(
                  child: Table(
                    columnWidths: {
                      0: FixedColumnWidth(35), // Width for S.no column
                      1: FixedColumnWidth(120), // Width for Date column
                      2: FixedColumnWidth(70), // Width for Amount column
                      3: FixedColumnWidth(70), // Width for Status column
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
                              child: Text('S',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Date',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Amount',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Status',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Action',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      for (var index = 0; index < _data.length; index++)
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text((index + 1)
                                    .toString()), // Convert index to string
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(_data[index]['date_time'] ??
                                    ''), // Access 'date' from _data
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    _data[index]['final_amount']?.toString() ??
                                        ''), // Convert to string
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(_data[index]['status'] ??
                                    ''), // Access 'status' from _data
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PayDetails(
                                                  id: _data[index]['id'],
                                                )));
                                    print(
                                        'Button pressed for serial: ${_data[index]['id']}');
                                  },
                                  child: Text(
                                    'Details',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.orange[900]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    // Select Date
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      // Select Time

      // Combine Date and Time
      DateTime selectedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      // Check if the selected date and time are not in the past

      setState(() {
        selectedDate = pickedDate;
      });

      formattedDateTime = DateFormat('yyyy-MM').format(selectedDateTime);

      print('Selected DateTime: $formattedDateTime');
      getSubscriptions();
    } else {
      DateTime now = DateTime.now();
      formattedDateTime = DateFormat('yyyy-MM-ddTHH:mm').format(now);

      print('Selected DateTime: $formattedDateTime');
    }
  }

  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> getSubscriptions() async {
    String? userID = await getData('userid');
    String url = 'https://ellostars.com/api/subscriptions-list';
    Map<String, String> data = {
      'agent_id': userID ?? "",
      "month": formattedDateTime
    };
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('ellostars:ellostars'));

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        print("Subscription: $jsonData");
        List<dynamic> fetchedList = jsonData['lists'];

        // Convert fetchedList to List<Map<String, dynamic>>
        List<Map<String, dynamic>> dataList = List<Map<String, dynamic>>.from(
          fetchedList.map((item) => Map<String, dynamic>.from(item)),
        );

        // Update state variable _data with fetched data
        setState(() {
          _data = dataList;
        });
      } else {
        final jsonData = jsonDecode(response.body);
        print('Error data: $jsonData');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
