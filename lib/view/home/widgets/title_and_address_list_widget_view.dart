import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/address_vo.dart';
import 'package:hs_cargo_customer_app/view/home/widgets/address_box_view.dart';

class TitleAndAddressListWidgetView extends StatelessWidget {
  final String title;
  final List<AddressVO> list;
  const TitleAndAddressListWidgetView({
    super.key,
    required this.title,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: ConfigStyle.boldStyleTwo(
            DIMEN_SIXTEEN,
            Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AddressBoxView(
              address: list[0].address,
              state: list[0].state,
              phone: list[0].phone,
            ),
            AddressBoxView(
              address: list[1].address,
              state: list[1].state,
              phone: list[1].phone,
            ),
          ],
        ),
        const SizedBox(height: DIMEN_TWENTY),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AddressBoxView(
              address: list[2].address,
              state: list[2].state,
              phone: list[2].phone,
            ),
            AddressBoxView(
              address: list[3].address,
              state: list[3].state,
              phone: list[3].phone,
            ),
          ],
        ),
      ],
    );
  }
}
