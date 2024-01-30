import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StartingLocationSectionView extends StatelessWidget {
  const StartingLocationSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration:
              const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
          child: const Center(
            child: Icon(
              MdiIcons.target,
              size: 32,
              color: MATERIAL_COLOR,
            ),
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
