import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/tracking_data_vo.dart';
import 'package:hs_cargo_customer_app/view/tracking/widgets/parcel_list_item_detail_view.dart';
import 'package:hs_cargo_customer_app/view/tracking_detail/screen/tracking_detail_screen.dart';

class ParcelListView extends StatelessWidget {
  final List<TrackingDataVO>? parcelList;
  const ParcelListView({
    Key? key,
    required this.parcelList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ParcelListItemDetailView(
          route:
              "${parcelList?[index].receivePoint}-${parcelList?[index].dropoffPoint}",
          token: parcelList?[index].token ?? "",
          status: parcelList?[index].wayStatus ?? "",
          onTap: () {
            Functions.transition(context,
                TrackingDetailScreen(trackingData: parcelList?[index]));
          },
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: parcelList?.length ?? 0,
    );
  }
}
