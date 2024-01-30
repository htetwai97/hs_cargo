import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';

class AddressBoxView extends StatelessWidget {
  final String state, address, phone;
  final double height;
  const AddressBoxView({
    super.key,
    required this.address,
    required this.state,
    required this.phone,
    this.height = 140,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              Functions.buildBoxShadow(),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    state,
                    style: ConfigStyle.boldStyleTwo(
                      DIMEN_SIXTEEN,
                      MATERIAL_COLOR,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                child: Text(
                  address,
                  maxLines: 5,
                  style: ConfigStyle.regularStyleThree(
                    DIMEN_FOURTEEN - 2,
                    MENU_THREE_COLOR,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                child: Text(
                  phone,
                  style: ConfigStyle.regularStyleThree(
                    DIMEN_FOURTEEN - 2,
                    APP_THEME_COLOR,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
