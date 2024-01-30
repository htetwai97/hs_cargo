import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/view/onboarding/screen/onboarding_screen.dart';
import 'package:hs_cargo_customer_app/view/rider_login/screen/rider_login_screen.dart';

class UserConfirmScreen extends StatelessWidget {
  const UserConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MATERIAL_COLOR,
      body: SizedBox(
        height: scaleHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //const SizedBox(height: 50),
            Image.asset(
              "assets/images/delivery_driver.jpg",
              width: scaleWidth(context),
            ),
            //const SizedBox(height: 30),
            Text(
              "Are you a rider?",
              style: ConfigStyle.regularStyleThree(
                18,
                BLACK_HEAVY,
              ),
            ),
            //const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: MATERIAL_COLOR,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: BLACK_LIGHT, width: 0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () {
                    Functions.replacementTransition(context, const OnboardScreen());
                  },
                  child: Text(
                    "No",
                    style: ConfigStyle.regularStyleOne(
                      14,
                      BLACK_LIGHT,
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.purpleAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: BLACK_LIGHT, width: 0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () {
                    Functions.transition(context, const RiderLoginScreen());
                  },
                  child: Text(
                    "Yes",
                    style: ConfigStyle.regularStyleOne(
                      14,
                      MATERIAL_COLOR,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
