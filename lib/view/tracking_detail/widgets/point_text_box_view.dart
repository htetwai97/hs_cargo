import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';

class PointTextBoxView extends StatelessWidget {
  final String text;
  const PointTextBoxView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 100,
      child: Center(
        child: Text(
          text,
          style: ConfigStyle.regularStyleOne(
            14,
            MATERIAL_COLOR,
          ),
        ),
      ),
    );
  }
}
