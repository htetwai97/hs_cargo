import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/view/rider_login/widgets/email_text_field_widget.dart';
import 'package:hs_cargo_customer_app/view/rider_login/widgets/pw_text_field_widget.dart';
import 'package:hs_cargo_customer_app/view/way_list/screen/way_list_screen.dart';

class RiderLoginScreen extends StatelessWidget {
  const RiderLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: scaleHeight(context) / 2.4,
                    decoration: const BoxDecoration(
                      color: MATERIAL_COLOR,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(-100),
                        bottomLeft: Radius.circular(
                          160,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/driver_image.jpg",
                        width: scaleWidth(context) - 140,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: BLACK_HEAVY,
                      size: 24,
                    ),
                  ),
                ],
              ),
              Container(
                height: scaleHeight(context) / 1.6,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(-100),
                    bottomLeft: Radius.circular(
                      160,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    EmailTextFieldWidget(
                      emailController: TextEditingController(),
                      onChanged: (e) {},
                    ),
                    PasswordTextFieldWidget(
                      isObscure: true,
                      passwordController: TextEditingController(),
                      onPressedVisibleIcon: () {},
                      onChanged: (e) {},
                    ),
                    const SizedBox(height: 80),
                    MaterialButton(
                      color: MATERIAL_COLOR,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: BLACK_LIGHT, width: 0.4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        Functions.replacementTransition(
                            context, const WayListScreen());
                      },
                      child: Text(
                        "Login",
                        style: ConfigStyle.regularStyleOne(
                          14,
                          BLACK_HEAVY,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
