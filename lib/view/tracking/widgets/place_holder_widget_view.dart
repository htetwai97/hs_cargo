import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';

class PlaceHolderWidgetView extends StatelessWidget {
  const PlaceHolderWidgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/search_hs_cargo.jpg",
          width: scaleWidth(context) - 200,
          fit: BoxFit.fitWidth,
        ),
        Text(
          "Search with token or phone number",
          style: ConfigStyle.boldStyleThree(
            DIMEN_FOURTEEN,
            Colors.grey,
          ),
        ),
      ],
    );
  }
}
