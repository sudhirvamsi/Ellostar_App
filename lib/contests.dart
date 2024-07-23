import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contests_screen extends StatefulWidget {
  const Contests_screen({super.key});

  @override
  State<Contests_screen> createState() => _Contests_screen();
}

class _Contests_screen extends State<Contests_screen> {
  @override
  void initState() {
    getContests();
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
          'Contexts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
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

  Future<void> getContests() async {
    setState(() {
      isLoading = true;
    });

    String url = "https://ellostars.com/api/contests";
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
    final Uri url = await Uri.parse(link);
    if (await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
