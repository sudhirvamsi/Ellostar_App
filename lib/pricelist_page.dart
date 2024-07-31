import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class payouts_screen extends StatefulWidget {
  const payouts_screen({super.key});

  @override
  State<payouts_screen> createState() => _payouts_screen();
}

class _payouts_screen extends State<payouts_screen> {
  // Map<String, dynamic> mahesh = {};
  List<dynamic> payouts = [];
  DateTime selectedDate = DateTime(2024);
  String formattedDateTime = '';
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Payouts',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        backgroundColor: Color(0xfffff8f8),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
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
                    borderRadius: BorderRadius.circular(9.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 246, 245, 245),
                      width: 1.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    color: Colors.orange,
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDateTime(context),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange.shade400),
                  ),
                  fillColor: Colors.orange.shade50,
                ),
                onTap: () => _selectDateTime(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select Event Date & Time';
                  }
                  return null;
                },
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: payouts.length,
                    itemBuilder: (context, index) {
                      final service = payouts[index];
                      return maheshdata(service['date_time'], service['amount'],
                          service['status'], service['note']);
                    }),
              ),
            ],
          ),
        ));
  }

  Widget maheshdata(String date, String amount, String status, String details) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 220,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Date:',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amount: $amount',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Status: $status',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Note:-',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    SizedBox(
                      width: 350,
                      child: Text(details),
                    ),
                  ],
                )
              ],
            )
          ],
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
      initialDatePickerMode: DatePickerMode.year,
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

      formattedDateTime = DateFormat('yyyy').format(selectedDateTime);

      print('Selected DateTime: $formattedDateTime');
      payoutsApi();
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

  Future<void> payoutsApi() async {
    String url = 'https://ellostars.com/api/payouts';
    String? userID = await getData('userid');
    Map<String, dynamic> data = {
      "agent_id": userID,
      "type": "year",
      "date": formattedDateTime,
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
        String responseBody = response.body.trim();
        if (responseBody.startsWith(RegExp(r'[0-9]'))) {
          responseBody = responseBody.substring(responseBody.indexOf('{'));
        }

        // Now decode the JSON
        Map<String, dynamic> result = jsonDecode(responseBody);
        setState(() {
          payouts = result['details'];
        });
        print('Yes, its working: $result');
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Handle non-200 status code here
      }
    } catch (e) {
      print('Error making API call: $e');
      // Handle other exceptions
    }
  }
}
