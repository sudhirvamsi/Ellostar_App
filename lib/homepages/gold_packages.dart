import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GoldPackages extends StatefulWidget {
  const GoldPackages({super.key});

  @override
  State<GoldPackages> createState() => _GoldPackagesState();
}

class _GoldPackagesState extends State<GoldPackages> {
  List<dynamic> silverpackages = [];
  final PageController _controller = PageController();
  bool isLoading = false;
  bool addedcart = false;

  @override
  void initState() {
    super.initState();
    goldpacages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : silverpackages.isEmpty
                      ? const Center(child: Text('NO SERVICE PACKAGES FOUND'))
                      : PageView.builder(
                          controller: _controller,
                          itemCount: silverpackages.length,
                          itemBuilder: (context, index) {
                            final service = silverpackages[index];
                            return packageslist(
                              service["title"],
                              service["price"].toString(),
                              service["commission"]["agent_commission"]
                                  .toString(),
                              service["commission"]["agent_commission_amount"]
                                  .toString(),
                              service["description"],
                              service['id'],
                            );
                          },
                        )),
          Container(
            alignment: const Alignment(0, 0.9),
            child: SmoothPageIndicator(
              controller: _controller,
              count: silverpackages.length,
              effect: WormEffect(
                  dotColor: Colors.orange.shade200,
                  activeDotColor: Colors.orange),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Future<void> goldpacages() async {
    setState(() {
      isLoading = true;
    });
    String url = 'https://ellostars.com/api/get-packages';

    Map<String, String> data = {
      'service_id': "2",
      "sub_service_id": "4",
      "agent_id": "1",
      "type": "gold",
    };

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
          silverpackages = jsondata['services'];
          print("packageslist:$silverpackages");
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

  Future<void> addtocart() async {
    setState(() {
      isLoading = true;
    });
    String url = 'https://ellostars.com/api/add-cart';

    Map<String, String> data = {
      'agent_id': "2",
      "service_id": "4",
    };

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
          silverpackages = jsondata['services'];
          print("packageslist:$silverpackages");
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

Widget packageslist(
  String title,
  String price,
  String commission,
  String commissionAmount,
  String description,
  String id,
) {
  return Column(
    children: [
      SizedBox(
        height: 20,
      ),
      Container(
        width: 400,
        height: 520,
        padding: const EdgeInsets.only(
          top: 30,
          left: 10,
          right: 10,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    '₹',
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '/-',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    minimumSize: const Size(380, 59),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey[700],
                      thickness: 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'What You Get',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey[700],
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(description),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 237, 240, 248)),
                child: Center(
                  child: Text(
                    "Ellostar's commission is $commission = Rs $commissionAmount/- ",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    ],
  );
}
