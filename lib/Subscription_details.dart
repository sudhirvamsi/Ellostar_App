import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PayDetails extends StatefulWidget {
  final String id;
  const PayDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<PayDetails> createState() => _PayDetailsState();
}

class _PayDetailsState extends State<PayDetails> {
  Map<String, dynamic> jsonData = {};
  String? commissionAmount;
  String? serviceTitle;
  String? servicePrice;

  @override
  void initState() {
    super.initState();
    getSubscriptionDetails();
  }

  Future<void> getSubscriptionDetails() async {
    String url = 'https://ellostars.com/api/subscription-detail';
    Map<String, String> data = {'subscription_id': widget.id};
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
        setState(() {
          jsonData = jsonDecode(response.body)['details'];

          // Access client information
          //  String clientId = jsonData['client_info']['sc_id'];
          //  String clientName = jsonData['client_info']['sc_client_name'];
          //  String clientEmail = jsonData['client_info']['sc_client_email'];
          //  String clientPhone = jsonData['client_info']['sc_client_phone_no'];

          // Access payment details
          //   String orderId = jsonData['pay_orderID'];
          //   String paymentId = jsonData['pay_paymentID'];

          // Access service details (assuming you want to work with the first service for this example)
          List<dynamic> serviceInfos = jsonData['services_info'];

          if (serviceInfos.isNotEmpty) {
            var firstService = serviceInfos[0];
            // String serviceId = firstService['id'];
            serviceTitle = firstService['service_info']['title'];
            String serviceDescription =
                firstService['service_info']['description'];
            //  String serviceImage = firstService['service_info']['image'];
            servicePrice = firstService['service_info']['price'];
            //  String commissionPercentage =
            firstService['service_info']['commission']['agent_commission'];
            commissionAmount = firstService['service_info']['commission']
                    ['agent_commission_amount']
                .toString();

            print("Service Title: $serviceTitle");
            print("Service Description: $serviceDescription");
            print("Commission Amount: $commissionAmount");

            // Store data into local variables or class properties
            // Assign these values to your class properties for use in the build method or elsewhere in your Flutter widget
          } else {
            // Handle case where no services are found (optional)
          }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Payment details', [
              _buildRow('Payment order id:', jsonData['pay_orderID']),
              _buildRow('Payment id:', jsonData['pay_paymentID']),
            ]),
            _buildSection('Order details', [
              _buildRow('Reference id:', jsonData['reference_id']),
              _buildRow('Date & Time:', jsonData['date_time']),
              _buildRow('Status:', jsonData['status']),
            ]),
            _buildSection('Payment data', [
              _buildRow('Amount:', jsonData['amount']),
              _buildRow('Tax:', jsonData['tax']),
              _buildRow('Grand total:', jsonData['final_amount']),
            ]),
            _buildColoredSection(
              'Ellostar commission',
              commissionAmount.toString(),
              Colors.orange,
            ),
            _buildSection('Subscribed services', [
              _buildServiceRow(
                serviceTitle ?? "",

                servicePrice ?? "", // Replace with actual service data
              ),
              // Add more service rows as needed
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> rows) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xffFFF5F5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.orange.shade700,
              ),
            ),
            SizedBox(height: 20),
            ...rows,
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        Text(
          value ?? '',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildServiceRow(String title, String price) {
    return Row(
      children: [
        SizedBox(
          width: 280,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        Text(
          price,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _buildColoredSection(String title, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              value,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
