import 'package:ellostars/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse(
    "https://console.firebase.google.com/project/sunraise-crm/functions");

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserProfile()));
                  },
                  child: Text("Edit profile",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                ),
                SizedBox(
                  width: 90,
                ),
                Icon(Icons.arrow_forward_ios_sharp)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("About us",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                ),
                SizedBox(
                  width: 90,
                ),
                Icon(Icons.arrow_forward_ios_sharp)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("terms and conditions",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                ),
                SizedBox(
                  width: 90,
                ),
                Icon(Icons.arrow_forward_ios_sharp)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Button",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                ),
                SizedBox(
                  width: 90,
                ),
                Icon(Icons.arrow_forward_ios_sharp)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("Button",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Icon(Icons.arrow_forward_ios_sharp)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Sign out",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.arrow_forward_ios_sharp)
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> _launchUrl() async {
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }
  //  child: TextButton(
  //         onPressed: _launchUrl,
  //         child: Text('Show Flutter homepage'),
  //       ),
}
