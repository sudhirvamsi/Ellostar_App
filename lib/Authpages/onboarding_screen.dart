import 'package:ellostars/Authpages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

class onboarding_screen extends StatefulWidget {
  const onboarding_screen({super.key});

  @override
  State<onboarding_screen> createState() => _onboarding_screenState();
}

class _onboarding_screenState extends State<onboarding_screen> {
  @override
  final List<Introduction> introduction = [
    Introduction(
      imageUrl: 'assets/onboarding_screens/intro_1.png',
      title: 'Kickstart Your Career',
      titleTextStyle: TextStyle(
          color: Colors.orange, fontSize: 24, fontWeight: FontWeight.bold),
      subTitle:
          'Get flexible hours and endless growth opportunities with our platform.',
      subTitleTextStyle: TextStyle(fontSize: 16),
    ),
    Introduction(
      imageUrl: 'assets/onboarding_screens/intro_2.png',
      title: 'Kickstart Your Career',
      titleTextStyle: TextStyle(
          color: Colors.orange, fontSize: 24, fontWeight: FontWeight.bold),
      subTitle:
          'Get flexible hours and endless growth opportunities with our platform.',
      subTitleTextStyle: TextStyle(fontSize: 16),
    ),
    Introduction(
      imageUrl: 'assets/onboarding_screens/intro_3.png',
      title: 'Kickstart Your Career',
      titleTextStyle: TextStyle(
          color: Colors.orange, fontSize: 24, fontWeight: FontWeight.bold),
      subTitle:
          'Get flexible hours and endless growth opportunities with our platform.',
      subTitleTextStyle: TextStyle(
        fontSize: 16,
      ),
    ),
  ];
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: Colors.orange.shade50,
      foregroundColor: Colors.orange,
      introductionList: introduction,
      onTapSkipButton: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return login_page();
        }));
      },
      skipTextStyle: const TextStyle(fontSize: 18, color: Colors.black38),
    );
  }
}
