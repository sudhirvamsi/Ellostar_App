import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class forgot_password extends StatefulWidget {
  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  TextEditingController _conformPaswword = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      backgroundColor: Colors.amber[50],
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            const Text(
              "Are you forgot your password please change the password",
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
                hintText: "enter your password",
                hintStyle: const TextStyle(color: Colors.black26),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 246, 245, 245),
                    width: 1.0,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                hintText: "enter your confirm password",
                hintStyle: const TextStyle(color: Colors.black26),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 246, 245, 245),
                    width: 1.0,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
          ],
        ),
      ),
    );
  }

  Future<void> forgotPassword() async {
    // String url =
  }
}
