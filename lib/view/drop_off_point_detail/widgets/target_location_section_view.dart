import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';

class TargetLocationSectionView extends StatelessWidget {
  const TargetLocationSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Center(
          child: Icon(
            Icons.location_on,
            size: 40,
            color: Colors.red,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            "No.192,Aung Thiri Street,Myoe thit,dawpon,yangon",
            style: ConfigStyle.regularStyleThree(
              14,
              BLACK_HEAVY,
            ),
          ),
        )
      ],
    );
  }
}
