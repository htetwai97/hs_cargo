import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/view/home/screen/home_screen.dart';
import 'package:hs_cargo_customer_app/view/onboarding/screen/onboarding_screen.dart';
import 'package:hs_cargo_customer_app/view/user_confirm/screen/user_confirm_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Functions.replacementTransition(context, const UserConfirmScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MATERIAL_COLOR,
      body: Center(
        child: Image.asset(
          "assets/images/cargo_logo.png",
          width: scaleWidth(context) - 120,
        ),
      ),
    );
  }
}
