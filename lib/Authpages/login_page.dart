import 'dart:convert';

import 'package:ellostars/Authpages/forgotpassword_screen.dart';
import 'package:ellostars/homepages/Bottombar.dart';
import 'package:ellostars/Authpages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final loginStatusProvider = FutureProvider<bool>((ref) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
});

class login_page extends StatefulWidget {
  login_page({super.key});

  //text editing controllers

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final GlobalKey<FormState> _UserFormKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool passToggle = true;
  bool _isLoading = false;
  Map<String, dynamic> Logindata = {};
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 50,
            ),
            //logo
            Image.asset(
              'assets/logo/ellostars.png',
              width: 200,
            ),
            const SizedBox(
              height: 50,
            ),

            //welcome back
            Text(
              'Start your freelancing journey here',
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 35),

            Form(
              key: _UserFormKey,
              child: Column(
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _usernameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      hintText: "Enter your user name",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 247, 247, 247),
                          width: 1.5,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 17),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade400),
                      ),
                      fillColor: Colors.orange.shade50,
                      //filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your user Name';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //password textfiled

                  TextFormField(
                    obscureText: passToggle,
                    controller: _passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.orange,
                      ),
                      hintText: "Enter your password",
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
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //forget password

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => forgot_password()));
                          },
                          child: Text('            Forgot Password?',
                              style: TextStyle(color: Colors.grey.shade600)))
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //sign in button

                  ElevatedButton(
                    onPressed: () {
                      if (_UserFormKey.currentState!.validate()) {
                        login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minimumSize: Size(300, 59),
                    ),
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          )
                        : const Center(
                            child: (Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                          ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  // not a member? register now

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.black38, fontSize: 14),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const register();
                          }));
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Future<void> _setLoginStatus(bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<void> login() async {
    setState(() {
      _isLoading = true;
    });
    String url = 'https://ellostars.com/api/login';
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Create a map to hold the username and password
    Map<String, String> data = {
      'username': username,
      'password': password,
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
        body: data, // Directly pass the data map
      );

      if (response.statusCode == 200) {
        await _setLoginStatus(true);
        final jsondata = jsonDecode(response.body);
        Logindata = jsondata["details"];
        String username = Logindata['e_name'].toString();
        String phonenum = Logindata['e_phone'].toString();
        String gmail = Logindata['e_email'].toString();
        String userid = Logindata['e_id'].toString();

        saveData("Username", username);
        saveData("userid", userid);

        saveData("Phonenumber", phonenum);
        saveData("Gmail", gmail);
        String massage = jsondata['msg'];

        print('data is :$Logindata');
        // Login successful
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
        showToast(context, "Ellostar user not found");
        print(
            'Response body: ${response.body}'); // Print the response body for debugging
        // Handle your logic for failed login here
      }
    } catch (e) {
      print('Error: $e');
      // Handle any network or server error here
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
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
