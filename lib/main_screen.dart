import 'package:ellostars/login_page.dart';
import 'package:ellostars/our_services_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class main_screen extends StatefulWidget {
  const main_screen({super.key});

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  String? userId;
  @override
  void initState() {
    super.initState();
    _fetchData(); // Fetch data when the widget is initialized
  }

  Future<void> _fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userId = prefs.getString("Username");
    });
  }

  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> signout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow.shade800),
                        ),
                        Icon(
                          CupertinoIcons.person_fill,
                          color: Colors.brown[900],
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                        Text(
                          userId ?? "mahesh",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        )
                      ],
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.bell)),
                IconButton(
                    onPressed: () {
                      signout(context);
                    },
                    icon: const Icon(Icons.logout))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        color: Colors.orange.shade100,
                        offset: const Offset(5, 5))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text('\₹ 1,00,000.00',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    children: [],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: Colors.white38, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.person,
                              size: 15,
                              color: Colors.brown.shade900,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('User Id',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                            Text('000786',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Our Services',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[700]),
                ),
                // GestureDetector(
                //   onTap: (){
                //
                //   },
                //   child:
                //   Text('View All',style: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //       color: Colors.brown[700]
                //   ),
                //   ),
                // )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: ListView(
                  children: const [
                    our_services_list(
                        iconImagePath: 'assets/icons/digital-mar.png',
                        titleTitle: 'Digital Marketing',
                        titleSubTitle: '360° marketing strategy'),
                    our_services_list(
                        iconImagePath: 'assets/icons/web-dev.png',
                        titleTitle: 'Web Development',
                        titleSubTitle: 'Responsive, Reliable, Remarkable'),
                    our_services_list(
                        iconImagePath: 'assets/icons/mobile-app.png',
                        titleTitle: "Mobile App's",
                        titleSubTitle: 'Think It, Dream It, We’ll Build It'),
                    our_services_list(
                        iconImagePath: 'assets/icons/hospital_managment.png',
                        titleTitle: "Hospital Management",
                        titleSubTitle: 'We offer full-fledged 360° '),
                    our_services_list(
                        iconImagePath: 'assets/icons/ecommers.png',
                        titleTitle: "Ellocart",
                        titleSubTitle: 'Local Online Shopping App'),
                    our_services_list(
                        iconImagePath: 'assets/icons/location.png',
                        titleTitle: "Ello pages",
                        titleSubTitle: 'Find all you need here'),
                    our_services_list(
                        iconImagePath: 'assets/icons/kiran-tv.png',
                        titleTitle: "Surya Kiran Tv",
                        titleSubTitle: 'Online Shopping App'),
                    our_services_list(
                        iconImagePath: 'assets/icons/health.png',
                        titleTitle: "Godavari Health",
                        titleSubTitle: 'Online Shopping App'),
                    our_services_list(
                        iconImagePath: 'assets/icons/landu.png',
                        titleTitle: "Landu",
                        titleSubTitle: 'Explore new properties'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
