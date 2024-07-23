import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Archivers_screen extends StatefulWidget {
  const Archivers_screen({super.key});

  @override
  State<Archivers_screen> createState() => _Archivers_screen();
}

class _Archivers_screen extends State<Archivers_screen> {
  @override
  void initState() {
    getAchivers();
    super.initState();
  }

  bool isLoading = false;
  String mage = '';
  String pdf = '';
  String video = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Achievers',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
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
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Image's",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.orange, shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () {
                                _launchUrl(mage);
                              },
                              icon: Icon(
                                Icons.image,
                                size: 34,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.orange.shade300,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Video's",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.orange, shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () {
                                _launchUrl(video);
                              },
                              icon: Icon(
                                Icons.video_camera_back_outlined,
                                size: 34,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.orange.shade300,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "PDF's",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.orange, shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () {
                                _launchUrl(pdf);
                              },
                              icon: Icon(
                                Icons.picture_as_pdf,
                                size: 34,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getAchivers() async {
    setState(() {
      isLoading = true;
    });

    String url = "https://ellostars.com/api/achievers";
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization':
              'Basic ' + base64Encode(utf8.encode('ellostars:ellostars')),
        },
      );
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body)['details'];
        mage = result[0]['source'];
        pdf = result[1]['source'];
        video = result[2]['source'];
        print("object:$mage");
        print("datais contests:$pdf");
      } else {}
    } catch (e) {
      print("Error: $e");
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _launchUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
