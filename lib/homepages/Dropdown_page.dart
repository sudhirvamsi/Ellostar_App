import 'dart:convert';
import 'package:ellostars/Achievers.dart';
import 'package:ellostars/homepages/Subscription.dart';
import 'package:ellostars/homepages/addbank_details.dart';
import 'package:ellostars/contests.dart';
import 'package:ellostars/materials.dart';
import 'package:ellostars/homepages/setting_page.dart';
import 'package:ellostars/pricelist_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? username;
  String? gmail;
  Map<String, dynamic> Updatedata = {};
  @override
  void initState() {
    super.initState();
    getProfile();
  }

  bool isLoading = false;

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
          Updatedata = result['details'] ?? "";
          username = Updatedata['e_name'] ?? "";

          gmail = Updatedata['e_email'];

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

  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color(0xfffff8f8),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                username ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 18),
              ),
              accountEmail: Text(
                gmail ?? "",
                style: TextStyle(
                  color: Colors.orange.shade50,
                  fontSize: 14,
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                child: ClipOval(
                  child: (Icon(
                    Icons.person,
                    size: 35,
                  )),
                ),
              ),
              decoration: BoxDecoration(color: Colors.orange.shade700),
            ),
            ListTile(
              leading: Icon(
                Icons.dashboard_customize,
                color: Colors.orange.shade800,
              ),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.people_alt,
                color: Colors.orange.shade800,
              ),
              title: const Text('Subscriptions'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Subscription()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.grade_outlined,
                color: Colors.orange.shade800,
              ),
              title: const Text('Contests'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContestsScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.perm_media,
                color: Colors.orange.shade800,
              ),
              title: const Text('Achievers'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ArchiversScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.file_copy,
                color: Colors.orange.shade800,
              ),
              title: const Text('Materials'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MeterialScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.payment_sharp,
                color: Colors.orange.shade800,
              ),
              title: const Text('Payouts'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return payouts_screen();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance,
                color: Colors.orange.shade800,
              ),
              title: const Text('add bank details'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return addBanck_Details();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.orange.shade800,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingPage();
                }));
              },
            ),
          ],
        ));
  }
}
