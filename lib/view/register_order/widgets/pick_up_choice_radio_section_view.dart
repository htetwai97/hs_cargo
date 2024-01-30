import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/view/register_order/widgets/yes_or_no_radio_button_view.dart';

class PickupChoiceRadioSectionView extends StatelessWidget {
  final Function(String) onChoosePickupValue;
  const PickupChoiceRadioSectionView({
    Key? key,
    required this.onChoosePickupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick up",
            style: ConfigStyle.boldStyleTwo(DIMEN_SIXTEEN, Colors.black87),
          ),
          const SizedBox(
            height: 10,
          ),
          YesNoRadioButtons(
            onChoosePickupValue: (value) {
              onChoosePickupValue(value);
            },
          ),
        ],
      ),
    );
  }
}
