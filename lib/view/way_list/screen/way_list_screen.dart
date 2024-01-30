import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/network/response/get_way_plans_response.dart';
import 'package:hs_cargo_customer_app/view/way_list/bloc/way_list_bloc.dart';
import 'package:hs_cargo_customer_app/view/way_list/widgets/way_list_view_widgets.dart';
import 'package:provider/provider.dart';

class WayListScreen extends StatefulWidget {
  const WayListScreen({Key? key}) : super(key: key);

  @override
  State<WayListScreen> createState() => _WayListScreenState();
}

class _WayListScreenState extends State<WayListScreen> {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => WayListBloc(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade300,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hello, Htet Wai Lwin..!",
                            style: ConfigStyle.regularStyleTwo(
                              18,
                              MATERIAL_COLOR,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.menu,
                              color: MATERIAL_COLOR,
                            ),
                          ),
                        ],
                      ),
                      // TabBar(
                      //   onTap: (tab) {
                      //     setState(() {
                      //       this.tab = tab;
                      //     });
                      //   },
                      //   labelStyle:
                      //       ConfigStyle.regularStyleThree(14, MATERIAL_COLOR),
                      //   labelColor: Colors.yellowAccent,
                      //   unselectedLabelColor: MATERIAL_COLOR,
                      //   indicatorColor: Colors.transparent,
                      //   tabs: const [
                      //     Tab(
                      //       text: "Completed",
                      //     ),
                      //     Tab(
                      //       text: "Scheduled",
                      //     ),
                      //     Tab(
                      //       text: "Cancelled",
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                Selector<WayListBloc, List<WayPlanData>?>(
                  selector: (context, bloc) => bloc.wayList,
                  builder: (context, wayList, child) => WayListViewWidget(
                    tab: tab,
                    wayList: wayList,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
