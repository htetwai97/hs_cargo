import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/view/home/widgets/price_box_detail_view.dart';

class PriceBoxListView extends StatelessWidget {
  const PriceBoxListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Our Delivery Pricing",
          style: ConfigStyle.boldStyleTwo(
            DIMEN_SIXTEEN,
            Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PriceBoxDetailView(
              route: "BKK - YGN",
              valueOne: "2000 MMK",
              valueTwo: "1800 MMK",
              valueThree: "1500 MMK",
              valueFour: "1100 MMK",
              valueFive: "",
            ),
            PriceBoxDetailView(
              route: "BKK - MDY",
              valueOne: "2400 MMK",
              valueTwo: "2200 MMK",
              valueThree: "1800 MMK",
              valueFour: "1300 MMK",
              valueFive: "10000",
              isFifthRow: true,
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PriceBoxDetailView(
              route: "Measot - YGN",
              valueOne: "1700 MMK",
              valueTwo: "1500 MMK",
              valueThree: "1300 MMK",
              valueFour: "900 MMK",
              valueFive: "",
            ),
            PriceBoxDetailView(
              route: "Measot - MDY",
              valueOne: "2000 MMK",
              valueTwo: "1800 MMK",
              valueThree: "1500 MMK",
              valueFour: "1100 MMK",
              valueFive: "",
            ),
          ],
        ),
      ],
    );
  }
}
