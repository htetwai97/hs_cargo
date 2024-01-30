import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';

class ShowDialogTextRowWidget extends StatelessWidget {
  final String title, value;
  const ShowDialogTextRowWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: ConfigStyle.regularStyleTwo(
                  14,
                  BLACK_HEAVY,
                ),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: ConfigStyle.regularStyleTwo(
                  14,
                  BLACK_LIGHT,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
