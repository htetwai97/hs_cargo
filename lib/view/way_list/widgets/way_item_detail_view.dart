import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/view/way_list/widgets/location_address_and_date_box_view.dart';

class WayItemDetailView extends StatelessWidget {
  final int tab;
  final String pickUpLocation, pickupDateTime, total, max;
  final Function onTapDetail;
  const WayItemDetailView({
    Key? key,
    required this.tab,
    required this.pickUpLocation,
    required this.pickupDateTime,
    required this.total,
    required this.max,
    required this.onTapDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocationAddressAndDateBoxView(
          status: tab,
          title: "Way Plan Number",
          address: pickUpLocation,
          datetime: pickupDateTime,
        ),
        const SizedBox(height: 20),
        TotalOrderTextAndDetailButtonView(
          total: total,
          max: max,
          onTapDetail: () {
            onTapDetail();
          },
        ),
        SizedBox(
          height: 50,
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

class TotalOrderTextAndDetailButtonView extends StatelessWidget {
  final String total, max;
  final Function onTapDetail;
  const TotalOrderTextAndDetailButtonView({
    super.key,
    required this.total,
    required this.max,
    required this.onTapDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total Order-$total(Max $max)",
          style: ConfigStyle.regularStyleTwo(
            14,
            BLACK_HEAVY,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            onTapDetail();
          },
          child: Text(
            "Detail",
            style: ConfigStyle.regularStyleTwo(
              14,
              Colors.purple,
            ),
          ),
        ),
      ],
    );
  }
}
