import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';

class TextRowView extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final String textThree;
  final Color textColor;
  const TextRowView({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.textThree,
    this.textColor = BLACK_HEAVY,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Text(
                textOne,
                style: ConfigStyle.regularStyleTwo(
                  DIMEN_FOURTEEN,
                  textColor,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                textTwo,
                style: ConfigStyle.regularStyleTwo(
                  DIMEN_FOURTEEN,
                  textColor,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                textThree,
                style: ConfigStyle.regularStyleTwo(
                  DIMEN_FOURTEEN,
                  textColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
