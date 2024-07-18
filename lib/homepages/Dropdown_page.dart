import 'package:ellostars/Achievers.dart';
import 'package:ellostars/Authpages/login_page.dart';
import 'package:ellostars/homepages/addbank_details.dart';
import 'package:ellostars/contests.dart';
import 'package:ellostars/materials.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? username;
  String? gmail;
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      username = prefs.getString("Username");
      gmail = prefs.getString('Gmail');
    });
  }

  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.orange.shade50,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                username!,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 18),
              ),
              accountEmail: Text(
                gmail!,
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
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.people_alt,
                color: Colors.orange.shade800,
              ),
              title: const Text('Subscriptions'),
              onTap: () {},
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
                        builder: (context) => const Contests_screen()));
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
                        builder: (context) => const Archivers_screen()));
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
                        builder: (context) => const Meterial_screen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.payment_sharp,
                color: Colors.orange.shade800,
              ),
              title: const Text('Payouts'),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return payouts();
                // }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance,
                color: Colors.orange.shade800,
              ),
              title: const Text('add bank detals'),
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
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.orange.shade800,
              ),
              title: const Text('Logout'),
              onTap: () => signout(context),
            ),
          ],
        ));
  }

  Future<void> signout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.orange.shade50,
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
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
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
