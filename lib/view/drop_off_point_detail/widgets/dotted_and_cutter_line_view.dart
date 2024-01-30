import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/view/drop_off_point_detail/widgets/vertical_dot_dot_line_view.dart';

class DottedAndCutterLineView extends StatelessWidget {
  const DottedAndCutterLineView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 14),
          child: VerticalDottedLineView(),
        ),
        const SizedBox(width: 2),
        Expanded(
          child: Container(
            height: 0.5,
            color: BLACK_LIGHT,
          ),
        ),
      ],
    );
  }
}
