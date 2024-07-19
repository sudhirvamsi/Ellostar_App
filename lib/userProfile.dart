import 'dart:convert';

import 'package:ellostars/edit_userprofile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  final GlobalKey<FormState> _UserFormKey = GlobalKey<FormState>();

  late TextEditingController _usernameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  // late TextEditingController _stateController;
  // late TextEditingController _countryController;
  // late TextEditingController _cityController;
  // late TextEditingController _pincodeController;
  late TextEditingController _addressController;

  bool passToggle = true;
  bool isLoading = false;
  bool inactive = false;

  Map<String, dynamic> Updatedata = {};

  String username = " ";

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile info",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => editProfileState(
                                name: Updatedata['e_name'],
                                phonenum: Updatedata['e_phone'],
                                email: Updatedata['e_email'],
                                address: Updatedata['e_address'],
                                county: Updatedata['e_country'],
                                state: Updatedata['e_state'],
                                City: Updatedata['e_city'],
                                pinCode: Updatedata['e_pincode'],
                                altPho: Updatedata['e_alt_phone'],
                              )));
                },
                icon: Row(
                  children: [
                    Text(
                      "Edit",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    )
                  ],
                ))
          ],
          backgroundColor: Colors.orange,
        ),
        backgroundColor: Colors.orange[50],
        body: Updatedata.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _UserFormKey,
                  child: ListView(
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
                              Icons.person,
                              color: Colors.orange.shade900,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Personal info details",
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
                      Text(
                        "  Name",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextFormField(
                        readOnly: true,
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
                            borderSide:
                                BorderSide(color: Colors.orange.shade400),
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
                        readOnly: true,
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
                            borderSide:
                                BorderSide(color: Colors.orange.shade400),
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
                        readOnly: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: 'vasiss.143@gmail.com',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          labelStyle: TextStyle(color: Colors.orange),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange.shade400),
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
                      TextFormField(
                        readOnly: true,
                        controller: _addressController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: ("Address "),
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          labelStyle: TextStyle(color: Colors.orange),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange.shade400),
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
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ));
  }

  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> getProfile() async {
    setState(() {
      isLoading = true;
    });
    String? userID = await getData('userid');

    String url = "https://ellostars.com/api/get-profile/$userID";
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization':
              'Basic ' + base64Encode(utf8.encode('ellostars:ellostars')),
        },
      );
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        setState(() {
          Updatedata = result['details'];
          _usernameController =
              TextEditingController(text: Updatedata['e_name']);
          _phoneController = TextEditingController(text: Updatedata['e_phone']);
          _emailController = TextEditingController(text: Updatedata['e_email']);

          _addressController =
              TextEditingController(text: Updatedata['e_address']);

          print("userdetails$Updatedata");
        });
      } else {
        print('Not able to get countries');
      }
    } catch (e) {
      print("Error: $e");
    }
    setState(() {
      isLoading = false;
    });
  }
}
