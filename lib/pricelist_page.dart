import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class payouts_screen extends StatefulWidget {
  const payouts_screen({super.key});

  @override
  State<payouts_screen> createState() => _payouts_screen();
}

class _payouts_screen extends State<payouts_screen> {
  Map<String, dynamic> mahesh = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: mahesh.length,
            itemBuilder: (context, index) {
              return maheshdata(mahesh[''], mahesh[''], mahesh[''], mahesh['']);
            }));
  }

  Widget maheshdata(String date, String amount, String status, String details) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 220,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color(0xffFFF585), borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Date',
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
                  'Amount Rs\ $amount',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Status : \ $status',
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
                      'Note',
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

  Future<void> payoutsApi() async {
    String url = "https://ellostars.com/api/payouts";
    Map<String, dynamic> data = {"": "", " ": ""};
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('ellostars:ellostars'));

    final responce = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: data,
    );
    if (responce.statusCode == 200) {
      final result = jsonDecode(responce.body);
      print('yes its working:$result');
    } else {
      print('its not working');
    }
  }
}
