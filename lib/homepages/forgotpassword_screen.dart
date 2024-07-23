import 'dart:convert';

import 'package:ellostars/homepages/Bottombar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class recetPassword extends StatefulWidget {
  @override
  State<recetPassword> createState() => _recetPassword();
}

class _recetPassword extends State<recetPassword> {
  TextEditingController _conformPaswword = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _UserFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change Password",
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
      backgroundColor: Color(0xfffff8f8),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _UserFormKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "Are you want to change the password",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                    hintText: "enter new password",
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
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 5,
                ),

                TextFormField(
                  controller: _conformPaswword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.orange,
                    ),
                    hintText: "enter new confirm password",
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
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_UserFormKey.currentState!.validate()) {
                      forgotPassword();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfff85103),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    minimumSize: Size(300, 59),
                  ),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        )
                      : const Center(
                          child: (Text(
                            'Reset',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                        ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> forgotPassword() async {
    setState(() {
      isLoading = false;
    });
    String url = 'https://ellostars.com/api/update-password';
    String? userID = await getData('userid');

    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('ellostars:ellostars'));
    // Create a map to hold the username and password
    Map<String, String> data = {
      'e_id': userID ?? "",
      'password': _passwordController.text,
      'confirm_password': _conformPaswword.text,
    };
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

        String massage = jsondata['msg'];

        print('Login successful');
        showToast(context, massage);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Tabbar_screen(), // Replace with your login page
            ),
            (route) => false);
      } else {
        // Login failed
        print('Login failed');
        showToast(context, "");
        print(
            'Response body: ${response.body}'); // Print the response body for debugging
        // Handle your logic for failed login here
      }
    } catch (e) {
      print('Error: $e');
      // Handle any network or server error here
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
