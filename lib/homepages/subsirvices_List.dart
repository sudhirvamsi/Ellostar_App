import 'dart:convert';
import 'package:ellostars/homepages/subsirvices_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class DigitalMarketingPage extends StatefulWidget {
  final String serviceId;
  const DigitalMarketingPage({Key? key, required this.serviceId})
      : super(key: key);

  @override
  State<DigitalMarketingPage> createState() => _DigitalMarketingPageState();
}

class _DigitalMarketingPageState extends State<DigitalMarketingPage> {
  Map<String, dynamic> responseData = {};
  List<dynamic> subServices = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getSubServices();
  }

  Future<void> getSubServices() async {
    setState(() {
      isLoading = true;
    });

    String url = 'https://ellostars.com/api/get-service-detail';
    Map<String, String> data = {
      'service_id': widget.serviceId,
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
        final jsondata = jsonDecode(response.body);
        setState(() {
          responseData = jsondata['details'] ?? {};
          subServices = jsondata['details']['sub_services'] ?? [];
        });
      } else {
        final jsondata = jsonDecode(response.body);
        print('error data: $jsondata');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          responseData['title'] ?? "",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue[200],
      ),
      body: Scaffold(
        backgroundColor: Color(0xfffff8f8),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: ImageSlideshow(
                  indicatorColor: const Color.fromARGB(255, 19, 19, 19),
                  indicatorBackgroundColor: Colors.white,
                  height: 250,
                  autoPlayInterval: 4000,
                  indicatorRadius: 4,
                  isLoop: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('assets/icons/digi.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('assets/icons/seo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('assets/icons/smo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('assets/icons/smm.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('assets/icons/www.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('assets/icons/store.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('assets/icons/search.png'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      responseData['description'] ?? "",
                      style: const TextStyle(fontSize: 15),
                      // textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: isLoading
                          ? Center(child: CircularProgressIndicator())
                          : subServices.isEmpty
                              ? Center(
                                  child: Column(children: [
                                    Image.asset(
                                      'assets/noServices.png',
                                      width: 250,
                                      height: 250,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'No Services are Found',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ]),
                                )
                              : ListView.builder(
                                  itemCount: subServices.length,
                                  itemBuilder: (context, index) {
                                    final service = subServices[index];
                                    return ourSubServices(
                                      service['title'],
                                      service['description'],
                                      service['image'],
                                      service['id'],
                                    );
                                  },
                                ),
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

  Widget ourSubServices(
    String title,
    String description,
    String iconImagePath,
    String id,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        height: 110,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: CupertinoButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => subsurviceDetails(
                          subserviceId: id,
                          serviceId: widget.serviceId,
                        )));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                child: Image.network(
                  iconImagePath,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 13, color: Colors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => subsurviceDetails(
                        subserviceId: id,
                        serviceId: widget.serviceId,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
