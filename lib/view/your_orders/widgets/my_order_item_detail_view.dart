import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyOrderItemDetailView extends StatelessWidget {
  final Function onTapDetail;
  final String token,date;
  const MyOrderItemDetailView({
    super.key,
    required this.onTapDetail,
    required this.token,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Token#:$token",
                  style: ConfigStyle.regularStyleTwo(
                    14,
                    BLACK_HEAVY,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Ordered at $date",
                  style: ConfigStyle.regularStyleThree(
                    14,
                    BLACK_LIGHT,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: (){
                onTapDetail();
              },
              child: const Icon(
                MdiIcons.package,
                size: 44,
                color: Colors.red,
              ),
            ),
          ],
        ),
        // const SizedBox(height: 10),
        // Text(
        //   "Estimated delivery on 2023-12-03",
        //   style: ConfigStyle.regularStyleOne(
        //     14,
        //     Colors.red,
        //   ),
        // ),
        SizedBox(
          height: 40,
          child: Center(
            child: Container(
              height: 0.4,
              color: BLACK_LIGHT,
            ),
          ),
        ),
      ],
    );
  }
}
