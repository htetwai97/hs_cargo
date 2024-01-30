import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/network/response/get_way_plans_response.dart';
import 'package:hs_cargo_customer_app/view/dropoff_list/screen/drop_off_list_screen.dart';
import 'package:hs_cargo_customer_app/view/way_list/widgets/way_item_detail_view.dart';

class WayListViewWidget extends StatelessWidget {
  const WayListViewWidget({
    super.key,
    required this.tab,
    required this.wayList,
  });

  final int tab;
  final List<WayPlanData>? wayList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: wayList?.length ?? 0,
        itemBuilder: (context, index) {
          var way = wayList?[index];
          var today = DateTime.now().toString().substring(0, 10);
          bool isToday = today == way?.date;
          return WayItemDetailView(
            tab: tab,
            pickUpLocation: way?.wayNo ?? "",
            pickupDateTime: (isToday)
                ? "Today\n${way?.startTime ?? ""}"
                : "${way?.date ?? ""}\n${way?.startTime ?? ""}",
            max: "10",
            total: "${way?.totalOrder ?? ""}",
            onTapDetail: () {
              Functions.transition(
                context,
                DropOffListScreen(
                  status: tab,
                  wayPlanData: way,
                ),
              );
            },
          );
        });
  }
}
