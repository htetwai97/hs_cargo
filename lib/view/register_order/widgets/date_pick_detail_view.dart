import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';

class DatePickView extends StatelessWidget {
  final String dateName;
  final Function onTapDateIcon;

  const DatePickView({
    super.key,
    required this.dateName,
    required this.onTapDateIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: scaleWidth(context) / 20,
        vertical: scaleWidth(context) / 65,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: BLACK_LIGHT,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dateName,
            style: ConfigStyle.regularStyleTwo(
              DIMEN_FOURTEEN,
              BLACK_LIGHT,
            ),
          ),
          IconButton(
            onPressed: () {
              onTapDateIcon();
            },
            icon: const Icon(
              Icons.calendar_month,
              size: DIMEN_TWENTY_TWO,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
