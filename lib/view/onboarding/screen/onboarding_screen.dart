import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_string.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/view/home/widgets/readmore_readless_widget.dart';
import 'package:hs_cargo_customer_app/view/onboard_two/screen/onboarding_two_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MATERIAL_COLOR,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/onboarding_two.png"),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ReadMoreLessWidget(
                    title: 'မိတ်ဆက်',
                    text: INTRO_TEXT,
                    maxLines: 34,
                    minLines: 12,
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    color: Colors.deepPurple,
                    onPressed: () {
                      Functions.rightToLeftTransition(
                          context, const OnboardTwoScreen());
                    },
                    child: Text(
                      "SKIP",
                      style: ConfigStyle.regularStyleOne(
                        DIMEN_FOURTEEN,
                        MATERIAL_COLOR,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
