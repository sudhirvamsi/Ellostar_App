import 'dart:convert';

import 'package:ellostars/homepages/Bottombar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class addBanck_Details extends StatefulWidget {
  @override
  State<addBanck_Details> createState() => _addBanck_Details();
}

class _addBanck_Details extends State<addBanck_Details> {
  final GlobalKey<FormState> _UserFormKey = GlobalKey<FormState>();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _BankAccountController = TextEditingController();
  TextEditingController _ifsccodeController = TextEditingController();
  TextEditingController _upiidController = TextEditingController();

  bool passToggle = true;
  bool isLoading = false;

  String username = " ";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Bank Details",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.orange,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _UserFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange.shade100),
                        child: Icon(
                          Icons.account_balance,
                          color: Colors.orange.shade900,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Add Your Bank details",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.orange),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Bank Name",
                        // hintText: 'Bank Name',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        labelStyle: TextStyle(color: Colors.orange),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    controller: _BankAccountController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                    decoration: InputDecoration(
                        labelText: 'Account number',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        labelStyle: TextStyle(color: Colors.orange),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Account number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    controller: _ifsccodeController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: 'IFSC code',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        labelStyle: TextStyle(color: Colors.orange),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Ifsc code';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    controller: _upiidController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Upi id ",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        labelStyle: TextStyle(color: Colors.orange),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Upi id';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_UserFormKey.currentState!.validate()) {
                          subSurvicessdetails();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        minimumSize: Size(320, 59),
                      ),
                      child: Text(
                        'Add ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                ],
              ),
            ),
          ),
        ));
  }

  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> subSurvicessdetails() async {
    setState(() {
      isLoading = true;
    });
    String? userID = await getData('userid');
    String url = 'https://ellostars.com/api/edit-bank';

    // Create a map to hold the username and password
    Map<String, String> data = {
      "e_id": userID ?? "",
      'bank_name': _usernameController.text,
      "bank_account_number": _BankAccountController.text,
      'ifsc_code': _ifsccodeController.text,
      'upi_id': _upiidController.text
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
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Tabbar_screen()),
            (route) => false);
        showToast(context, "Updated Successfully");
        print("responce :$jsondata");
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

  void showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color.fromARGB(255, 126, 125, 125),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
  }
}
