import 'package:ellostars/Authpages/login_page.dart';
import 'package:ellostars/homepages/forgotpassword_screen.dart';
import 'package:ellostars/homepages/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: Color(0xfffff8f8),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit profile",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xfff85103),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => recetPassword()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reset Password",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xfff85103),
                    )
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                _launchUrl('https://ellostars.com/about');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "About us",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xfff85103),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                _launchUrl('https://ellostars.com/terms-and-conditions');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "terms and conditions",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xfff85103),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                _launchUrl('https://ellostars.com/privacy-policy');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "privacy-policy",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xfff85103),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () => signout(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sign out",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xfff85103),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.orange.shade50,
          title: const Text(
            'Confirm Logout',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          content: const Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            TextButton(
              onPressed: () async {
                // Clear the login status in shared preferences
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn', false);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          login_page(), // Replace with your login page
                    ),
                    (route) => false);
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.orange[900], fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _launchUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $link');
    }
  }
  //  child: TextButton(
  //         onPressed: _launchUrl,
  //         child: Text('Show Flutter homepage'),
  //       ),
}
