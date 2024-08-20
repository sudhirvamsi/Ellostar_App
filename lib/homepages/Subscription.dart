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
  DateTime selectedDate = DateTime.now();
  String formattedDateTime = '';
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getSubscriptions();
    _dateController.text = DateFormat('yyyy-MM').format(selectedDate);

    getSubscriptions();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Subscription',
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
          ),
        ),
      ),
      backgroundColor: Color(0xffFFF5F5),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _dateController,
              readOnly: true,
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
                  onPressed: () => _selectDateTime(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade400),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select Event Date & Time';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text(
              'Please select date for you want Services list',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              child: Table(
                columnWidths: {
                  0: FixedColumnWidth(35),
                  1: FixedColumnWidth(120),
                  2: FixedColumnWidth(70),
                  3: FixedColumnWidth(70),
                  4: FixedColumnWidth(80),
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
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Date',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Amount',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Status',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Action',
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                            child: Text((index + 1).toString()),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(_data[index]['date_time'] ?? ''),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                                _data[index]['final_amount']?.toString() ?? ''),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(_data[index]['status'] ?? ''),
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
                                    ),
                                  ),
                                );
                                print(
                                    'Button pressed for serial: ${_data[index]['id']}');
                              },
                              child: Text(
                                'Details',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.orange[900]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        formattedDateTime = DateFormat('yyyy-MM').format(selectedDate);
        _dateController.text = formattedDateTime;
      });

      print('Selected DateTime: $formattedDateTime');
      getSubscriptions();
    } else {
      DateTime now = DateTime.now();
      setState(() {
        formattedDateTime = DateFormat('yyyy-MM').format(now);
        _dateController.text = formattedDateTime;
        print('formattedDateTime${_dateController.text}');
      });
      getSubscriptions();

      print('No Date Selected, using current DateTime: $formattedDateTime');
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
      "month": _dateController.text,
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

        List<Map<String, dynamic>> dataList = List<Map<String, dynamic>>.from(
          fetchedList.map((item) => Map<String, dynamic>.from(item)),
        );

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
