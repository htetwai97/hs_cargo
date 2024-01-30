import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';

class ParcelListItemDetailView extends StatelessWidget {
  final String token, route, status;
  final Function onTap;
  const ParcelListItemDetailView({
    super.key,
    required this.route,
    required this.token,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scaleWidth(context),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                token,
                style: ConfigStyle.boldStyleThree(
                  DIMEN_FOURTEEN,
                  BLACK_HEAVY,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                route,
                style: ConfigStyle.boldStyleThree(
                  DIMEN_FOURTEEN,
                  BLACK_LIGHT,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              onTap();
            },
            child: Container(
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Text(
                  status,
                  style: ConfigStyle.regularStyleTwo(
                    DIMEN_FOURTEEN,
                    MATERIAL_COLOR,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
