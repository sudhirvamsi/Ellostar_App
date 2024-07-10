import 'package:ellostars/home_page.dart';
import 'package:ellostars/main_screen.dart';
import 'package:ellostars/onboarding_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

final loginStatusProvider = FutureProvider<bool>((ref) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ello stars',
      home: splash_screen(),
    );
  }
}

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/logo/logo.gif',
      splashIconSize: 2000.0,
      centered: true,
      duration: 6800,
      nextScreen: const AppNavigator(),
      backgroundColor: Colors.orange.shade50,
    );
  }
}

class AppNavigator extends ConsumerWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(loginStatusProvider);

    return isLoggedIn.when(
      data: (loggedIn) {
        if (loggedIn) {
          // User is logged in, show EventScreenList
          return Tabbar_screen();
        } else {
          // User is not logged in, show LoginPage
          return const onboarding_screen();
        }
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => const Text('Error loading login status'),
    );
  }
}
