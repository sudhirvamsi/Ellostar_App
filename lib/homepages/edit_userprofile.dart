import 'dart:convert';

import 'package:ellostars/homepages/Bottombar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class editProfileState extends StatefulWidget {
  final String name;
  final String phonenum;
  final String email;
  final String address;
  final String county;
  final String state;
  final String City;
  final String pinCode;
  final String altPho;
  editProfileState(
      {super.key,
      required this.name,
      required this.phonenum,
      required this.email,
      required this.address,
      required this.county,
      required this.state,
      required this.City,
      required this.pinCode,
      required this.altPho});
  @override
  State<editProfileState> createState() => _editProfileStateState();
}

class _editProfileStateState extends State<editProfileState> {
  final GlobalKey<FormState> _UserFormKey = GlobalKey<FormState>();

  late TextEditingController _usernameController;

  late TextEditingController _phoneController;

  late TextEditingController _emailController;

  late TextEditingController _addressController;

  bool passToggle = true;

  bool isLoading = false;

  bool inactive = false;

  String username = " ";

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(text: widget.phonenum);
    _emailController = TextEditingController(text: widget.email);
    _addressController = TextEditingController(text: widget.address);
    _usernameController = TextEditingController(text: widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Profile ",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          backgroundColor: Colors.orange,
        ),
        backgroundColor: Color(0xfffff8f8),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _UserFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "  Name",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextFormField(
                    controller: _usernameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: 'Sudhir',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      labelStyle: TextStyle(color: Colors.orange),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                    ),
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
                  Text(
                    "  Mobile",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextFormField(
                    controller: _phoneController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: '+91 9700168016',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      labelStyle: TextStyle(color: Colors.orange),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "  Gmail",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: 'vasiss.143@gmail.com',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      labelStyle: TextStyle(color: Colors.orange),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email id';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "  Address",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextFormField(
                    controller: _addressController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: ("Address "),
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      labelStyle: TextStyle(color: Colors.orange),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_UserFormKey.currentState!.validate()) {
                          editprofile();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xfff85103),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        minimumSize: Size(390, 59),
                      ),
                      child: isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              'Update details ',
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

  Future<void> editprofile() async {
    setState(() {
      isLoading = true;
    });
    String? userID = await getData('userid');
    String url = 'https://ellostars.com/api/edit-profile';

    // Create a map to hold the username and password
    Map<String, String> data = {
      "e_id": userID ?? "",
      'name': _usernameController.text,
      "pcode": "+91",
      "phone": _phoneController.text,
      "alt_phone": widget.altPho,
      "email": _emailController.text,
      "country": widget.county,
      "state": widget.state,
      "city": widget.City,
      "pincode": widget.pinCode,
      "address": _addressController.text,
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
        showToast(context, "Updated Successfully");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Tabbar_screen()),
            (route) => false);
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
