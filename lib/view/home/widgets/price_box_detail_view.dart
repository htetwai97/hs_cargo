import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';

class PriceBoxDetailView extends StatelessWidget {
  final bool isFifthRow;
  final String route, valueOne, valueTwo, valueThree, valueFour, valueFive;
  const PriceBoxDetailView({
    super.key,
    required this.route,
    required this.valueOne,
    required this.valueTwo,
    required this.valueThree,
    required this.valueFour,
    required this.valueFive,
    this.isFifthRow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
        gradient: const LinearGradient(
          colors: [
            APP_THEME_COLOR,
            SEPERATOR_COLOR,
            APP_THEME_COLOR,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            route,
            style: ConfigStyle.boldStyleOne(
              DIMEN_FOURTEEN + 1,
              MATERIAL_COLOR,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1-50 KG",
                style: ConfigStyle.boldStyleOne(
                  DIMEN_FOURTEEN,
                  Colors.yellowAccent,
                ),
              ),
              Text(
                valueOne,
                style: ConfigStyle.boldStyleOne(
                  DIMEN_FOURTEEN,
                  Colors.yellowAccent,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "50-100 KG",
                style: ConfigStyle.boldStyleOne(
                  DIMEN_FOURTEEN,
                  Colors.yellowAccent,
                ),
              ),
              Text(
                valueTwo,
                style: ConfigStyle.boldStyleOne(
                  DIMEN_FOURTEEN,
                  Colors.yellowAccent,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "100-300KG",
                style: ConfigStyle.boldStyleOne(
                  DIMEN_FOURTEEN,
                  Colors.yellowAccent,
                ),
              ),
              Text(
                valueThree,
                style: ConfigStyle.boldStyleOne(
                  DIMEN_FOURTEEN,
                  Colors.yellowAccent,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "300-500 KG",
                style: ConfigStyle.boldStyleOne(
                  DIMEN_FOURTEEN,
                  Colors.yellowAccent,
                ),
              ),
              Text(
                valueFour,
                style: ConfigStyle.boldStyleOne(
                  DIMEN_FOURTEEN,
                  Colors.yellowAccent,
                ),
              ),
            ],
          ),
          Visibility(
            visible: isFifthRow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "10-10 KG",
                  style: ConfigStyle.boldStyleOne(
                    DIMEN_FOURTEEN,
                    Colors.yellowAccent,
                  ),
                ),
                Text(
                  valueFive,
                  style: ConfigStyle.boldStyleOne(
                    DIMEN_FOURTEEN,
                    Colors.yellowAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
