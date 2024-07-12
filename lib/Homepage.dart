import 'dart:convert';

import 'package:ellostars/Dropdown_page.dart';
import 'package:ellostars/subsirvices_List.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  String? username;
  String? userid;
  List<dynamic> survicessList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
    getSurvicess();
  }

  Future<void> _fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userid = prefs.getString('userid');
    });
  }

  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.orange.shade50,
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(CupertinoIcons.bell)),
            ],
          )
        ],
      ),
      drawer: Dropdown(),
      backgroundColor: Colors.orange.shade50,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        color: Colors.orange.shade100,
                        offset: const Offset(5, 5))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text('\₹ 1,00,000.00',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: Colors.white38, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.person,
                              size: 15,
                              color: Colors.brown.shade900,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('User Id',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                            Text(userid ?? "",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Our Services',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[700]),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: survicessList.length,
                        itemBuilder: (context, index) {
                          final services = survicessList[index];
                          return ourServices(
                              services['title'],
                              services['description'],
                              services['image'],
                              services['id']);
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ourServices(
    String titleTitle,
    String titleSubTitle,
    String iconImagePath,
    String id,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        height: 110,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Image.network(
                iconImagePath,
                fit: BoxFit.cover,
                // width: 100,
                // height: 100,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titleTitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    titleSubTitle,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
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
                          builder: (context) => DigitalMarketingPage(
                                serviceId: id,
                              )));
                },
                icon: const Icon(Icons.arrow_forward_ios))
          ],
        ),
      ),
    );
  }

  Future<void> getSurvicess() async {
    setState(() {
      isLoading = true;
    });
    String url = 'https://ellostars.com/api/home';
    String? userID = await getData('userid');

    print("object:$userID");

    // Create a map to hold the username and password
    Map<String, String> data = {
      'e_id': userID ?? "",
    };

    // Encode the username and password for basic authentication
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
          survicessList = jsondata['details']['services'];
          isLoading = false;
        });

        print("survicesslisr:$survicessList");
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
