import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';

class LocationAddressAndDateBoxView extends StatelessWidget {
  final String title, address, datetime;
  final int status;
  const LocationAddressAndDateBoxView({
    super.key,
    required this.title,
    required this.address,
    required this.datetime,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: ConfigStyle.boldStyleOne(
                  16,
                  (status == 0)
                      ? APP_THEME_COLOR
                      : (status == 1)
                          ? Colors.orange
                          : Colors.redAccent,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                address,
                style: ConfigStyle.regularStyleTwo(
                  14,
                  BLACK_HEAVY,
                ),
              )
            ],
          ),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(width: 10),
        ),
        Expanded(
          flex: 2,
          child: Text(
            datetime,
            style: ConfigStyle.boldStyleOne(
              16,
              (status == 0)
                  ? APP_THEME_COLOR
                  : (status == 1)
                      ? Colors.orange
                      : Colors.redAccent,
            ),
          ),
        ),
      ],
    );
  }
}
