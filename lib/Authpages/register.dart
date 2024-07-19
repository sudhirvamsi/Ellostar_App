import 'dart:convert';

import 'package:ellostars/Authpages/login_page.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  final _phonenumberController = TextEditingController();
  final _alternateController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpassController = TextEditingController();
  final _userController = TextEditingController();

  final _pincodeController = TextEditingController();
  final _addressController = TextEditingController();
  final _referredController = TextEditingController();
  bool _isLoading = false;
  bool _isupload = false;
  List<Map<String, dynamic>> eventList = [];
  Map<String, dynamic>? selectedEvent;
  List<Map<String, dynamic>> stateList = [];
  Map<String, dynamic>? selectedState;
  List<Map<String, dynamic>> cityslist = [];
  Map<String, dynamic>? selectedCity;

  @override
  void initState() {
    super.initState();
    Countysget();
  }

  bool isChecked = false;

  bool _validateEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text(
          'Registration',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        titleTextStyle: const TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _registerKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Full name

                  const Text(
                    'Your Full Name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  TextFormField(
                    controller: _nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      hintText: "enter your name",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 246, 245, 245),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter first name";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  const Text(
                    'User Name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  TextFormField(
                    controller: _userController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      hintText: "enter your user name",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 246, 245, 245),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter user name';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // PHONE NUMBER

                  const Text(
                    'Mobile Number',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  TextFormField(
                    controller: _phonenumberController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.orange,
                      ),
                      hintText: "enter your mobile number",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 246, 245, 245),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Mobile Number";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // ALTERNATE PHONE NUMBER

                  const Text(
                    'Alternate Number',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  TextFormField(
                    controller: _alternateController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.orange,
                      ),
                      hintText: "enter your alternate number",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 246, 245, 245),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // EMAIL ID

                  const Text(
                    'Email Id',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  TextFormField(
                    controller: _emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.orange,
                      ),
                      hintText: "enter your email",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 246, 245, 245),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!_validateEmail(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),

                  // USER NAME

                  const SizedBox(
                    height: 15,
                  ),

                  // PASSWORD

                  const Text(
                    'Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  TextFormField(
                    controller: _passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.orange,
                      ),
                      hintText: "enter your password",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 246, 245, 245),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length <= 5) {
                        return 'Please enter min 6 lenght';
                      }
                      // Add more password validation if needed
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // CONFIRM PASSWORD

                  const Text(
                    'Confirm Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  TextFormField(
                    controller: _confirmpassController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.orange,
                      ),
                      hintText: "enter your confirm password",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 246, 245, 245),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm your password';
                      } else if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // COUNTRY

                  const Text(
                    'Country',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  DropdownButtonFormField<Map<String, dynamic>>(
                    value: selectedEvent,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: "Please select County",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 246, 245, 245),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      filled: true,
                    ),
                    onChanged: (Map<String, dynamic>? newValue) {
                      setState(() {
                        selectedEvent = newValue;
                        selectedState = null;
                        stateList = [];
                        print('Selected country: $selectedEvent');
                      });
                      StatesApi();
                    },
                    items: eventList
                        .map<DropdownMenuItem<Map<String, dynamic>>>(
                            (Map<String, dynamic> value) {
                      return DropdownMenuItem<Map<String, dynamic>>(
                        value: value,
                        child: Text(
                          value['name'],
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select County";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // STATE

                  const Text(
                    'State',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  DropdownButtonFormField<Map<String, dynamic>>(
                    value: selectedState,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: "Please select State",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 246, 245, 245),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      filled: true,
                    ),
                    onChanged: stateList.isNotEmpty
                        ? (Map<String, dynamic>? newValue) {
                            setState(() {
                              selectedState = newValue;
                              print('Selected state: $selectedState');
                            });
                            cityesApis();
                          }
                        : null,
                    items: stateList
                        .map<DropdownMenuItem<Map<String, dynamic>>>(
                            (Map<String, dynamic> value) {
                      return DropdownMenuItem<Map<String, dynamic>>(
                        value: value,
                        child: Text(
                          value['name'],
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select State";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // City

                  const Text(
                    'City',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  DropdownButtonFormField<Map<String, dynamic>>(
                    value: selectedCity,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: "Please select City",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 246, 245, 245),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      filled: true,
                    ),
                    onChanged: cityslist.isNotEmpty
                        ? (Map<String, dynamic>? newValue) {
                            setState(() {
                              selectedCity = newValue;
                              print('Selected state: $selectedCity');
                            });
                          }
                        : null,
                    items: cityslist
                        .map<DropdownMenuItem<Map<String, dynamic>>>(
                            (Map<String, dynamic> value) {
                      return DropdownMenuItem<Map<String, dynamic>>(
                        value: value,
                        child: Text(
                          value['name'],
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select City";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // PINCODE

                  const Text(
                    'Pincode',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  TextFormField(
                    controller: _pincodeController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.pin,
                        color: Colors.orange,
                      ),
                      hintText: "enter your pincode",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 246, 245, 245),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter pincode";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // ADDRESS

                  const Text(
                    'Address',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  TextFormField(
                    controller: _addressController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.location_on_rounded,
                        color: Colors.orange,
                      ),
                      hintText: "enter your address",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 246, 245, 245),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter your address";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // REFERRED BY

                  const Text(
                    'Referred By',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  TextFormField(
                    controller: _referredController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.people_alt,
                        color: Colors.orange,
                      ),
                      hintText: "referred",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 246, 245, 245),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      filled: true,
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Container(
                    child: (Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                            }),
                        const Text(
                          'AGREE TO OUR T&C & PRIVACY POLICY',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: isChecked
                        ? () {
                            if (_registerKey.currentState!.validate()) {
                              registation();
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minimumSize: Size(300, 59),
                    ),
                    child: _isupload
                        ? const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          )
                        : const Center(
                            child: (Text(
                              'Join As Ellostars Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                          ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> Countysget() async {
    String url = 'https://ellostars.com/api/countries';
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
          List<dynamic> data = result['details'];
          for (var item in data) {
            eventList.add({
              'id': item['id'],
              'name': item['name'],
            });
          }
        });
      } else {
        print('Not able to get countries');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> StatesApi() async {
    if (selectedEvent == null) {
      print('No country selected');
      return;
    }

    String url = 'https://ellostars.com/api/states';
    String countyid = selectedEvent!['id'].toString();
    print('countyid: $countyid');

    Map<String, String> data = {
      'country_id': countyid,
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
        print('States data: $jsondata');
        setState(() {
          List<dynamic> data = jsondata['details'];
          for (var item in data) {
            stateList.add({
              'id': item['id'],
              'name': item['name'],
            });
          }
        });
      } else {
        print('Failed to get states');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> cityesApis() async {
    if (selectedState == null) {
      print('No country selected');
      return;
    }

    String url = 'https://ellostars.com/api/cities';
    String Stateid = selectedState!['id'].toString();
    print('Stateid: $Stateid');

    Map<String, String> data = {
      'state_id': Stateid,
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
        print('States data: $jsondata');

        setState(() {
          List<dynamic> data = jsondata['details'];
          for (var item in data) {
            cityslist.add({
              'id': item['id'],
              'name': item['name'],
            });
          }
        });
      } else {
        print('Failed to get states');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> registation() async {
    setState(() {
      _isupload = true;
    });
    String url = 'https://ellostars.com/api/register';

    // Create a map to hold the username and password
    Map<String, String> data = {
      'name': _nameController.text,
      'username': _userController.text,
      'pcode': "91",
      'phone': _phonenumberController.text,
      'alt_phone': _alternateController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      'confirm_password': _confirmpassController.text,
      'country': selectedEvent!['id'].toString(),
      'state': selectedState!['id'].toString(),
      'city': selectedCity!['id'].toString(),
      'pincode': _pincodeController.text,
      'address': _addressController.text,
      'is_agree': "1",
      //'referred_by': _referredController.text,
    };
    print('rigested:$data');
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('ellostars:ellostars'));

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: data, // Directly pass the data map
      );

      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        print('Login successful:$jsondata');

        String massage = jsondata['msg'];

        print('Login successful');
        showToast(context, massage);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  login_page(), // Replace with your login page
            ),
            (route) => false);
      } else {
        // Login failed
        final jsondata = jsonDecode(response.body);
        String massage = jsondata['msg'];
        showToast(context, massage);
        print(
            'Response body: ${response.body}'); // Print the response body for debugging
        // Handle your logic for failed login here
      }
    } catch (e) {
      print('Error: $e');
      // Handle any network or server error here
    }
    setState(() {
      _isupload = false;
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
