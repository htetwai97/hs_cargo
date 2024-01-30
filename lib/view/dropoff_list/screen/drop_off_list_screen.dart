import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/network/response/get_way_plans_response.dart';
import 'package:hs_cargo_customer_app/view/drop_off_point_detail/screen/drop_off_point_detail_screen.dart';
import 'package:hs_cargo_customer_app/view/way_list/widgets/location_address_and_date_box_view.dart';

class DropOffListScreen extends StatelessWidget {
  final int status;
  final WayPlanData? wayPlanData;
  const DropOffListScreen({
    Key? key,
    required this.status,
    required this.wayPlanData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      size: 24,
                      color: BLACK_HEAVY,
                    ),
                  ),
                  const SizedBox(width: 60),
                  Text(
                    "Hello, Htet Wai Lwin..!",
                    style: ConfigStyle.boldStyleThree(
                      14,
                      BLACK_HEAVY,
                    ),
                  )
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  color: MATERIAL_COLOR,
                  boxShadow: [
                    Functions.buildBoxShadow(),
                  ],
                ),
                child: LocationAddressAndDateBoxView(
                  title: "Way Plan Number",
                  address: wayPlanData?.wayNo ?? "",
                  datetime: wayPlanData?.date ?? "",
                  status: status,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Drop off Points",
                  style: ConfigStyle.boldStyleThree(
                    16,
                    BLACK_HEAVY,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  color: MATERIAL_COLOR,
                  boxShadow: [
                    Functions.buildBoxShadow(),
                  ],
                ),
                child: ListView.builder(
                  itemCount: wayPlanData?.wayPlannings?.length ?? 0,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var way = wayPlanData?.wayPlannings?[index];
                    return Column(
                      children: [
                        LocationAddressAndDateBoxView(
                          title: "Drop Off Location(${index + 1})",
                          address: way?.wayPlanSchedule?.customerAddress ?? "",
                          datetime:
                              "Start-${way?.startTime ?? ""}\nEnd-${way?.endTime ?? ""}",
                          status: status,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              (status == 0)
                                  ? "Status-completed"
                                  : (status == 1)
                                      ? "Status-pending"
                                      : "Status-cancelled",
                              style: ConfigStyle.regularStyleTwo(
                                14,
                                BLACK_HEAVY,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Functions.transition(
                                    context, const DropOffPointDetailScreen());
                              },
                              child: Text(
                                "Detail",
                                style: ConfigStyle.regularStyleTwo(
                                  14,
                                  BLACK_HEAVY,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          child: Center(
                            child: Container(
                              height: 0.4,
                              color: BLACK_LIGHT,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
