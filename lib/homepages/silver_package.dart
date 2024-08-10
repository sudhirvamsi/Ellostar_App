import 'dart:convert';
import 'package:ellostars/homepages/cartpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SilverPackages extends StatefulWidget {
  final String subid;
  final String id;
  const SilverPackages({super.key, required this.subid, required this.id});

  @override
  State<SilverPackages> createState() => _SilverPackagesState();
}

class _SilverPackagesState extends State<SilverPackages> {
  List<dynamic> silverpackages = [];
  final PageController _controller = PageController();
  bool isadded = false;
  bool isLoading = false;
  String? id;

  @override
  void initState() {
    super.initState();
    silverpacages();
    _controller.addListener(_pageListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_pageListener);
    _controller.dispose();
    super.dispose();
  }

  void _pageListener() {
    int currentPage = _controller.page!.round();
    if (silverpackages.isNotEmpty) {
      final currentService = silverpackages[currentPage];
      final currentId = currentService['id'];
      final addedToCart = currentService['added_to_cart'] == 1;

      setState(() {
        id = currentId;
        isadded = !addedToCart;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : silverpackages.isNotEmpty
                    ? PageView.builder(
                        controller: _controller,
                        itemCount: silverpackages.length,
                        itemBuilder: (context, index) {
                          final service = silverpackages[index];
                          final addedToCart = service['added_to_cart'] == 1;

                          return Column(
                            children: [
                              const SizedBox(height: 20),
                              Container(
                                width: 400,
                                height: 560,
                                padding: const EdgeInsets.only(
                                  top: 30,
                                  left: 10,
                                  right: 10,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        service["title"],
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
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
                                            service["price"].toString(),
                                            style: const TextStyle(
                                                fontSize: 44,
                                                fontWeight: FontWeight.bold),
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
                                        onPressed: !addedToCart
                                            ? () {
                                                addtocart(service['id']);
                                              }
                                            : () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Cartitems()));
                                              },
                                        style: !addedToCart
                                            ? ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                minimumSize:
                                                    const Size(380, 59),
                                              )
                                            : ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 243, 58, 33),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                minimumSize:
                                                    const Size(380, 59),
                                              ),
                                        child: !addedToCart
                                            ? Text(
                                                "Add to Cart",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            : Text(
                                                " go to cart",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                      ),
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
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0),
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
                                      Text(service["description"]),
                                      const SizedBox(height: 50),
                                      // Container(
                                      //   padding: const EdgeInsets.all(10),
                                      //   margin: const EdgeInsets.symmetric(
                                      //       horizontal: 10.0),
                                      //   decoration: BoxDecoration(
                                      //       borderRadius:
                                      //           BorderRadius.circular(10),
                                      //       color: const Color.fromARGB(
                                      //           255, 237, 240, 248)),
                                      //   child: Center(
                                      //     child: Text(
                                      //       "Ellostar's commission is ${service["commission"]["agent_commission"].toString()} = Rs ${service["commission"]["agent_commission_amount"]}/- ",
                                      //       style:
                                      //           const TextStyle(fontSize: 16),
                                      //     ),
                                      //   ),
                                      // ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    : const Center(child: Text('No Service found')),
          ),
          // Container(
          //   alignment: const Alignment(0, 0.9),
          //   child: SmoothPageIndicator(
          //     controller: _controller,
          //     count: silverpackages.length,
          //     effect: const WormEffect(
          //       dotColor: Color.fromARGB(255, 128, 208, 255),
          //       activeDotColor: Color.fromARGB(255, 17, 16, 16),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 90),
        ],
      ),
    );
  }

  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> addtocart(String id) async {
    String url = 'https://ellostars.com/api/add-cart';
    String? userID = await getData('userid');

    Map<String, String> data = {
      'agent_id': userID ?? "",
      "service_id": id,
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
        final data = jsondata['msg'];
        print("status:$data");

        setState(() {
          // Update the silverpackages list to reflect the new state
          for (var package in silverpackages) {
            if (package['id'] == id) {
              package['added_to_cart'] = 1;
              break;
            }
          }
          isadded = false;
        });
      } else {
        final jsondata = jsonDecode(response.body);
        final data = jsondata['msg'];
        if (data == "Already Added To Cart") {
          setState(() {
            for (var package in silverpackages) {
              if (package['id'] == id) {
                package['added_to_cart'] = 1;
                break;
              }
            }
            isadded = false;
          });
        }
        print('error data:$jsondata');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> silverpacages() async {
    setState(() {
      isLoading = true;
    });
    String url = 'https://ellostars.com/api/get-packages';
    String? userID = await getData('userid');

    Map<String, String> data = {
      'service_id': widget.id,
      "sub_service_id": widget.subid,
      "agent_id": userID ?? "",
      "type": "silver",
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
          print("list of the packages$jsondata");
          if (silverpackages.isNotEmpty) {
            final firstService = silverpackages[0];
            id = firstService['id'];
            isadded = firstService['added_to_cart'] != 1;
          }
        });
      } else {
        final jsondata = jsonDecode(response.body);
        print('error data:$jsondata');
      }
    } catch (e) {
      print('Error: $e');
    }
    setState(() {
      isLoading = false;
    });
  }
}
