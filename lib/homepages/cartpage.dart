import 'dart:convert';

import 'package:ellostars/homepages/subsirvices_List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/utils.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class Cartitems extends StatefulWidget {
  const Cartitems({super.key});

  @override
  State<Cartitems> createState() => _Cartitems();
}

class _Cartitems extends State<Cartitems> {
  List<dynamic> silverpackages = [];
  Map<String, dynamic> chekoutdata = {};
  List<dynamic> amountdetails = [];
  String subscribed_reference_id = '';
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _razorpay = Razorpay();
  Map<String, dynamic> options = {};
  @override
  void initState() {
    super.initState();
    cartpacages();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("_handlePaymentSuccess${{response.paymentId}}");
    paymentApi(response.paymentId!);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("_handlePaymentError");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    print("_handleExternalWallet");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  int? totalAmount;
  int? amount;
  int? tax;

  bool isadded = false;

  void _deleteItem(int index) {
    setState(() {
      silverpackages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart products",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Color(0xfffff8f8),
      body: Column(
        children: [
          Expanded(
              child: isadded
                  ? const Center(child: CircularProgressIndicator())
                  : silverpackages.isEmpty
                      ? Center(
                          child: Image.asset(
                          "assets/Nocart.png",
                          height: 200,
                          width: 200,
                        ))
                      : ListView.builder(
                          itemCount: silverpackages.length,
                          itemBuilder: (context, index) {
                            final service = silverpackages[index];

                            return Column(
                              children: [
                                CupertinoButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DigitalMarketingPage(
                                                  serviceId: '',
                                                )));
                                  },
                                  child: Container(
                                    width: 400,
                                    height: 100,
                                    padding: const EdgeInsets.only(
                                      top: 30,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  service["service_info"]
                                                          ["title"] ??
                                                      '',
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Row(
                                                children: [
                                                  const Text(
                                                    '₹',
                                                    style:
                                                        TextStyle(fontSize: 25),
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Text(
                                                    service["service_info"]
                                                                ["price"]
                                                            ?.toString() ??
                                                        '0',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.orange[900]),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Text(
                                                    '/-    ',
                                                    style:
                                                        TextStyle(fontSize: 25),
                                                  ),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            _deleteItem(index);
                                                            removepacages(
                                                                service['id']);
                                                            cartpacages();
                                                          },
                                                          icon: Icon(
                                                            Icons.delete,
                                                            color: Colors.red,
                                                          ))
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )),
          silverpackages.isEmpty
              ? Center(
                  child: Text(
                  (''),
                ))
              : Container(
                  width: 400,
                  height: 210,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.orange[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Amount:',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$amount',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tax:',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$tax',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount:',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$totalAmount',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 29),
                        ElevatedButton(
                          onPressed: () {
                            checkout(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[50],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            minimumSize: const Size(384, 59),
                          ),
                          child: Text(
                            "Pay ₹ $totalAmount",
                            style: TextStyle(
                                color: Colors.orange[900], fontSize: 19),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  bool _validateEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  Future<void> checkout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.orange.shade50,
          title: const Text('Client Details'),
          content: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                          color: Colors.orange.shade900,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'Email Id',
                      labelStyle: TextStyle(
                          color: Colors.orange.shade900,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  validator: (value) {
                    if (GetUtils.isEmail(value!)) {
                      return null;
                    } else {
                      return 'Please enter your email';
                    }
                  },
                ),
                TextFormField(
                  controller: _phoneController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                          color: Colors.orange.shade900,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  validator: (value) {
                    if (GetUtils.isPhoneNumber(value!)) {
                      return null;
                    } else {
                      return 'Please enter your phone number';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.grey.shade600),
                        )),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            await checkoutApi();
                          } else {
                            print("some one is happend");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.orange.shade200,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30)),
                        child: const Text(
                          'Payment',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> cartpacages() async {
    setState(() {
      isadded = true;
    });
    String url = 'https://ellostars.com/api/get-cart';

    String? userID = await getData('userid');

    Map<String, String> data = {"agent_id": userID ?? "1"};

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
          silverpackages = jsondata['details'];

          amountdetails = jsondata['calculations'];
          amount = amountdetails[0]['amount'];
          tax = amountdetails[1]['tax'];
          totalAmount = amountdetails[3]['total_amount'];
          //id = jsondata['details']['id'];
        });
      } else {
        final jsondata = jsonDecode(response.body);
        print('error data:$jsondata');
      }
    } catch (e) {
      print('Error: $e');
    }
    setState(() {
      isadded = false;
    });
  }

  Future<void> checkoutApi() async {
    String? userID = await getData('userid');
    String url = 'https://ellostars.com/api/checkout';

    Map<String, String> data = {
      "agent_id": userID ?? "",
      "client_name": _nameController.text,
      "client_phone_no": _phoneController.text,
      "client_email": _emailController.text
    };
    print("checkout data $data");

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
          chekoutdata = jsondata['details'];
          subscribed_reference_id =
              jsondata['details']['subscribed_reference_id'];

          print('subscribed_reference_id :$subscribed_reference_id');
        });
        print("checkout Data:$jsondata");
        _razorpay.open(options = {
          'key': 'rzp_live_Cv4tNJlReGwrkM',
          'amount': totalAmount! * 100,
          'name': 'Ellostar',
          'description': _nameController.text,
          'prefill': {
            'contact': _phoneController.text,
            'email': _emailController.text
          }
        });
        _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
        _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
        _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
      } else {
        final jsondata = jsonDecode(response.body);
        print('error data:$jsondata');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> paymentApi(String payment) async {
    String url = 'https://ellostars.com/api/verify-payment';

    Map<String, String> data = {
      "subscribed_reference_id": subscribed_reference_id,
      "payment_id": "$payment",
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
        print("remove item:$jsondata");
      } else {
        final jsondata = jsonDecode(response.body);
        print('error data:$jsondata');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> removepacages(String id) async {
    String url = 'https://ellostars.com/api/delete-cart-item';

    Map<String, String> data = {"cart_id": id};

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
        print("remove item:$jsondata");
      } else {
        final jsondata = jsonDecode(response.body);
        print('error data:$jsondata');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
