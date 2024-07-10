import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class forgot_password extends StatefulWidget {
  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  TextEditingController forgotPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 260,
            ),
            TextFormField(
              controller: forgotPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
            )
          ],
        ),
      ),
    );
  }
}
