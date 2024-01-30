import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:hs_cargo_customer_app/view/home/screen/home_screen.dart';
import 'package:hs_cargo_customer_app/view/onboarding/screen/onboarding_screen.dart';
import 'package:hs_cargo_customer_app/view/pickup/screen/pick_up_screen.dart';
import 'package:hs_cargo_customer_app/view/rider_login/screen/rider_login_screen.dart';
import 'package:hs_cargo_customer_app/view/splash/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

