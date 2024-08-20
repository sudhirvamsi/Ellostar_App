import 'dart:convert';

import 'package:ellostars/homepages/silver_package.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class subsurviceDetails extends StatefulWidget {
  final String serviceId;
  final String subserviceId;
  const subsurviceDetails(
      {super.key, required this.serviceId, required this.subserviceId});

  @override
  State<subsurviceDetails> createState() => _subsurviceDetails();
}

class _subsurviceDetails extends State<subsurviceDetails> {
  @override
  void initState() {
    super.initState();
    subSurvicessdetails();
  }

  Map<String, dynamic> survicessList = {};
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                survicessList['title'] ?? "",
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: const Color(0xfffff8f8),
        body: survicessList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(19.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: const Color(0xfff4ecff),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      survicessList['image'] ?? ""),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'About:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  survicessList['description'] ?? "",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SilverPackages(
                            id: widget.serviceId,
                            subid: widget.subserviceId,
                          );
                        }));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: const Color(0xfff85103),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Our Packages',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }

  Future<void> subSurvicessdetails() async {
    setState(() {
      isLoading = true;
    });
    String url = 'https://ellostars.com/api/get-sub-service-detail';

    // Create a map to hold the username and password
    Map<String, String> data = {
      'sub_service_id': widget.subserviceId,
    };

    // Encode the username and password for basic authentication
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('ellostars:ellostars'))}';

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
        final jsondata = jsonDecode(response.body);
        setState(() {
          survicessList = jsondata['services'];
          print("survicesslisr:$survicessList");
        });
      } else {
        final jsondata = jsonDecode(response.body);
        print('error data:$jsondata');

        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
    setState(() {
      isLoading = false;
    });
  }
}
