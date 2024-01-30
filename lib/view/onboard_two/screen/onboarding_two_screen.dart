import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_string.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:hs_cargo_customer_app/view/home/screen/home_screen.dart';
import 'package:hs_cargo_customer_app/view/home/widgets/readmore_readless_widget.dart';

class OnboardTwoScreen extends StatelessWidget {
  const OnboardTwoScreen({Key? key}) : super(key: key);

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
                Image.asset("assets/images/onboarding_one.png"),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ReadMoreLessWidget(
                    title: 'Rules and Regulation fot HS Cargo Service',
                    text: RULES,
                    maxLines: 34,
                    minLines: 12,
                    visible: true,
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        color: Colors.deepPurple,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "<< PREVIOUS",
                          style: ConfigStyle.regularStyleOne(
                            DIMEN_FOURTEEN,
                            MATERIAL_COLOR,
                          ),
                        ),
                      ),
                      MaterialButton(
                        color: Colors.deepPurple,
                        onPressed: () {
                          Functions.replacementTransition(
                              context, const BottomNavigationScreen());
                        },
                        child: Text(
                          "NEXT >>",
                          style: ConfigStyle.regularStyleOne(
                            DIMEN_FOURTEEN,
                            MATERIAL_COLOR,
                          ),
                        ),
                      ),
                    ],
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
