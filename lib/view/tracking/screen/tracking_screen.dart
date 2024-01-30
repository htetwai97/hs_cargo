import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/view/home/widgets/banner_section_view.dart';
import 'package:hs_cargo_customer_app/view/tracking/bloc/tracking_bloc.dart';
import 'package:hs_cargo_customer_app/view/tracking/widgets/parcel_list_view.dart';
import 'package:hs_cargo_customer_app/view/tracking/widgets/track_parcel_text_field_view.dart';
import 'package:provider/provider.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => TrackingBloc(),
        child: Scaffold(
          backgroundColor: MATERIAL_COLOR,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: DIMEN_SIXTEEN),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: BLACK_HEAVY,
                      ),
                    ),
                  ),
                  Text(
                    "Hi there👋",
                    style: ConfigStyle.boldStyleThree(
                      DIMEN_FOURTEEN,
                      Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Tracking your shipment",
                    style: ConfigStyle.boldStyleThree(
                      DIMEN_SIXTEEN,
                      BLACK_HEAVY,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Consumer<TrackingBloc>(
                    builder: (context, bloc, child) => TrackParcelTextFieldView(
                      controller: bloc.controller,
                      focusNode: FocusNode(),
                      onTapSearch: () {
                        bloc.onSearch();
                      },
                    ),
                  ),
                  const SizedBox(height: DIMEN_TWENTY + 10),
                  const BannerSectionHomeView(
                    dividerHeight: 4.4,
                    viewPort: 1,
                    bannerList: [
                      "assets/images/track_one.png",
                      "assets/images/track_two.png",
                      "assets/images/track_three.png",
                      "assets/images/track_four.png"
                    ],
                  ),
                  const SizedBox(height: DIMEN_TWENTY + 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your Parcels",
                      style: ConfigStyle.boldStyleThree(
                        DIMEN_SIXTEEN,
                        BLACK_HEAVY,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  ///const PlaceHolderWidgetView(),
                  Consumer<TrackingBloc>(
                    builder: (context, bloc, child) =>
                        (bloc.parcelList != null &&
                                bloc.parcelList?.length != 0)
                            ? ParcelListView(
                                parcelList: bloc.parcelList,
                              )
                            : SizedBox(
                                width: 200,
                                height: 200,
                                child: Center(
                                  child: Text(
                                    "No results found",
                                    style: ConfigStyle.regularStyleThree(
                                      20,
                                      BLACK_HEAVY,
                                    ),
                                  ),
                                ),
                              ),
                  ),
                  const SizedBox(height: DIMEN_TWENTY + 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
