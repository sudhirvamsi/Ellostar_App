import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Meterial_screen extends StatefulWidget {
  const Meterial_screen({Key? key}) : super(key: key);

  @override
  State<Meterial_screen> createState() => _Meterial_screen();
}

class _Meterial_screen extends State<Meterial_screen> {
  @override
  void initState() {
    getAchievers();
    super.initState();
  }

  bool isLoading = false;
  List<Map<String, String>> pdfList = [];
  List<Map<String, String>> videoList = [];
  List<Map<String, String>> otherList = [];

  String dropdownValue = 'Images'; // Default dropdown value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meterials',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.orange.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xffFFF5F5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Select Option',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>['Images', 'Videos', 'PDFs']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(color: Colors.orange.shade300, thickness: 1),
                    SizedBox(height: 20),
                    _buildListForType(dropdownValue),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListForType(String dropdownValue) {
    switch (dropdownValue) {
      case 'Images':
        return _buildItemList(Icons.image, otherList);
      case 'Videos':
        return _buildItemList(Icons.video_camera_back_outlined, videoList);
      case 'PDFs':
        return _buildItemList(Icons.picture_as_pdf, pdfList);
      default:
        return Container();
    }
  }

  Widget _buildItemList(IconData icon, List<Map<String, String>> itemList) {
    return Column(
      children: itemList.map((item) {
        return ListTile(
          leading: Icon(icon),
          title: Text(item['title'] ?? 'Untitled'),
          onTap: () => _launchUrl(item['source'] ?? 'no data found'),
        );
      }).toList(),
    );
  }

  Future<void> getAchievers() async {
    setState(() {
      isLoading = true;
    });

    String url = "https://ellostars.com/api/materials";
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization':
              'Basic ' + base64Encode(utf8.encode('ellostars:ellostars')),
        },
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'ok') {
          final details = jsonResponse['details'];

          for (var item in details) {
            if (item['type'] == '3') {
              pdfList.add({
                'title': item['title'] ?? '',
                'source': item['source'] ?? '',
              });
            } else if (item['type'] == '2') {
              videoList.add({
                'title': item['title'] ?? '',
                'source': item['source'] ?? '',
              });
            } else {
              otherList.add({
                'title': item['title'] ?? '',
                'source': item['source'] ?? '',
              });
            }
          }
        } else {
          print("Error: ${jsonResponse['msg']}");
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _launchUrl(String url) async {
    if (url.isNotEmpty) {
      if (!await canLaunch(url)) {
        throw 'Could not launch $url';
      } else {
        await launch(url);
      }
    }
  }
}
