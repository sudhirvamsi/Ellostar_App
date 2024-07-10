import 'dart:convert';

import 'package:ellostars/login_page.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _nameController = TextEditingController();
  final _fatherController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _alternateController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpassController = TextEditingController();
  final _userController = TextEditingController();
  final _countryController = TextEditingController();

  final _cityController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _addressController = TextEditingController();
  final _referredController = TextEditingController();

  bool isChecked = false;
  void printMessage() {
    print('user accepted the agrement');
  }

  @override
  void initState() {
    Countysget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text('Registration'),
        titleTextStyle: const TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: (ListView(
          shrinkWrap: true,
          children: [
            // Full name

            const Text(
              'Your Full Name',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 5,
            ),

            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.orange,
                ),
                hintText: "enter your name",
                hintStyle: const TextStyle(color: Colors.black26),
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

            // FATHER / GUARDIAN NAME

            const Text(
              'Father / Guardian Name',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 5,
            ),

            TextFormField(
              controller: _fatherController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.family_restroom,
                  color: Colors.orange,
                ),
                hintText: "enter your father / guardian name",
                hintStyle: const TextStyle(color: Colors.black26),
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

            // PHONE NUMBER

            const Text(
              'Mobile Number',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 5,
            ),

            TextFormField(
              controller: _phonenumberController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.phone,
                  color: Colors.orange,
                ),
                hintText: "enter your mobile number",
                hintStyle: const TextStyle(color: Colors.black26),
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

            // ALTERNATE PHONE NUMBER

            const Text(
              'Alternate Number',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 5,
            ),

            TextFormField(
              controller: _alternateController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.phone,
                  color: Colors.orange,
                ),
                hintText: "enter your alternate number",
                hintStyle: const TextStyle(color: Colors.black26),
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

            // EMAIL ID

            const Text(
              'Email Id',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 5,
            ),

            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.orange,
                ),
                hintText: "enter your email",
                hintStyle: const TextStyle(color: Colors.black26),
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

// USER NAME

            const Text(
              'User Name',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 5,
            ),

            TextFormField(
              controller: _userController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.orange,
                ),
                hintText: "enter your user name",
                hintStyle: const TextStyle(color: Colors.black26),
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

            // PASSWORD

            const Text(
              'Password',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 5,
            ),

            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.orange,
                ),
                hintText: "enter your password",
                hintStyle: const TextStyle(color: Colors.black26),
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

            // CONFIRM PASSWORD

            const Text(
              'Confirm Password',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 5,
            ),

            TextFormField(
              controller: _confirmpassController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.orange,
                ),
                hintText: "enter your confirm password",
                hintStyle: const TextStyle(color: Colors.black26),
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

            // COUNTRY

            const Text(
              'Country',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 5,
            ),

            TextFormField(
              controller: _countryController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.map,
                  color: Colors.orange,
                ),
                hintText: "enter your country",
                hintStyle: const TextStyle(color: Colors.black26),
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

            // STATE

            const Text(
              'State',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 5,
            ),

            TextFormField(
              controller: _countryController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.location_city,
                  color: Colors.orange,
                ),
                hintText: "enter your state",
                hintStyle: const TextStyle(color: Colors.black26),
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

            // City

            const Text(
              'City',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 5,
            ),

            TextFormField(
              controller: _cityController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.location_city_sharp,
                  color: Colors.orange,
                ),
                hintText: "enter your city",
                hintStyle: const TextStyle(color: Colors.black26),
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

            // PINCODE

            const Text(
              'Pincode',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 5,
            ),

            TextFormField(
              controller: _pincodeController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.pin,
                  color: Colors.orange,
                ),
                hintText: "enter your pincode",
                hintStyle: const TextStyle(color: Colors.black26),
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

            // ADDRESS

            const Text(
              'Address',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 5,
            ),

            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.location_on_rounded,
                  color: Colors.orange,
                ),
                hintText: "enter your address",
                hintStyle: const TextStyle(color: Colors.black26),
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

            const SizedBox(
              height: 15,
            ),

            // REFERRED BY

            const Text(
              'Referred By',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ],
              )),
            ),
            const SizedBox(
              height: 25,
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: MaterialButton(
                  onPressed: isChecked ? printMessage : null,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return login_page();
                      }));
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 22),
                      child: Text(
                        'Join As Ellostars Now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.orange,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  Future<void> Countysget() async {
    String Url = 'https://ellostars.com/api/countries';
    try {
      final response = await http.get(
        Uri.parse(Url),
        headers: {
          'Authorization':
              'Basic ' + base64Encode(utf8.encode('ellostars:ellostars')),
        },
      );
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        print('countycode data:$result');
      } else {
        print('not able to get');
      }
    } catch (e) {
      print("error$e");
    }
  }
}
