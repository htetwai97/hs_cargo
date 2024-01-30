import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/view/confirm_receive/screen/confirm_receive_screen.dart';
import 'package:hs_cargo_customer_app/view/drop_off_point_detail/widgets/dotted_and_cutter_line_view.dart';
import 'package:hs_cargo_customer_app/view/drop_off_point_detail/widgets/starting_location_section_view.dart';
import 'package:hs_cargo_customer_app/view/drop_off_point_detail/widgets/target_location_section_view.dart';
import 'package:hs_cargo_customer_app/view/way_list/screen/way_list_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DropOffPointDetailScreen extends StatelessWidget {
  const DropOffPointDetailScreen({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Cannot launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MATERIAL_COLOR,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple.shade300,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: MATERIAL_COLOR,
            ),
          ),
          title: Text(
            "Drop Off Location(1)",
            style: ConfigStyle.regularStyleThree(
              14,
              MATERIAL_COLOR,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset("assets/images/yangon_map.jpg"),
                  Container(
                    height: 20,
                    decoration: const BoxDecoration(
                      color: MATERIAL_COLOR,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        height: 1,
                        width: 40,
                        color: BLACK_HEAVY,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 30),
                      child: FloatingActionButton(
                        backgroundColor: Colors.blue,
                        onPressed: () {
                          String url =
                              'https://www.google.com/maps/dir/16.82679903757615, 96.1645194415659/16.832843915237575, 96.17933504815934';
                          _launchUrl(url);
                        },
                        child: const Icon(
                          Icons.location_searching,
                          color: MATERIAL_COLOR,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: const Center(
                  child: Column(
                    children: [
                      StartingLocationSectionView(),
                      DottedAndCutterLineView(),
                      TargetLocationSectionView(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  height: 30,
                  child: Center(
                    child: Container(
                      height: 0.4,
                      color: BLACK_HEAVY,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent),
                      ),
                      onPressed: () {
                        Functions.logoutDialog(context, 100, () {
                          Navigator.pop(context);
                        }, () {
                          Functions.replacementTransition(
                            context,
                            const WayListScreen(),
                          );
                        },
                            "Are you sure to cancel this ride?",
                            "This route will be regarded as incomplete mission.",
                            "No",
                            "Yes");
                      },
                      child: Text(
                        "Cancel Ride",
                        style: ConfigStyle.regularStyleThree(
                          14,
                          MATERIAL_COLOR,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        Functions.rightToLeftTransition(
                          context,
                          const ConfirmReceiveScreen(),
                        );
                      },
                      child: Text(
                        "Confirm Receipt",
                        style: ConfigStyle.regularStyleThree(
                          14,
                          MATERIAL_COLOR,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
