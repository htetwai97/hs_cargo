import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/tracking_data_vo.dart';
import 'package:hs_cargo_customer_app/view/tracking_detail/widgets/point_section_view.dart';
import 'package:hs_cargo_customer_app/view/tracking_detail/widgets/text_row_view.dart';
import 'package:hs_cargo_customer_app/view/tracking_detail/widgets/track_slider_view.dart';

class TrackingDetailScreen extends StatefulWidget {
  final TrackingDataVO? trackingData;
  const TrackingDetailScreen({
    Key? key,
    required this.trackingData,
  }) : super(key: key);

  @override
  State<TrackingDetailScreen> createState() => _TrackingDetailScreenState();
}

class _TrackingDetailScreenState extends State<TrackingDetailScreen> {
  List<String> gateList = [];
  int currentStatus = 0;
  @override
  void initState() {
    super.initState();
    gateList.add(widget.trackingData?.receivePoint ?? "");
    gateList.add(widget.trackingData?.dropoffPoint ?? "");
    gateList.add("Customer");
    if (widget.trackingData?.receiveStatus != "Not Started" &&
        widget.trackingData?.dropoffStatus == "Not Started" &&
        widget.trackingData?.customerStatus == "Not Started") {
      currentStatus = 0;
    } else if (widget.trackingData?.receiveStatus != "Not Started" &&
        widget.trackingData?.dropoffStatus != "Not Started" &&
        widget.trackingData?.customerStatus == "Not Started") {
      currentStatus = 1;
    } else if (widget.trackingData?.receiveStatus != "Not Started" &&
        widget.trackingData?.dropoffStatus != "Not Started" &&
        widget.trackingData?.customerStatus != "Not Started") {
      currentStatus = 2;
    } else {
      currentStatus = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                "Token-${widget.trackingData?.token ?? "0000"} Detail",
                style: ConfigStyle.boldStyleThree(
                  DIMEN_SIXTEEN,
                  BLACK_HEAVY,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    Functions.buildBoxShadow(),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Purchase Receipt",
                      style: ConfigStyle.boldStyleThree(
                        DIMEN_FOURTEEN,
                        LOGIN_BUTTON_COLOR,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextRowView(
                      textOne:
                          "${widget.trackingData?.receivePoint}-${widget.trackingData?.dropoffPoint}\nDate",
                      textTwo: "Token No",
                      textThree: "Tracking No",
                    ),
                    TextRowView(
                      textOne: widget.trackingData?.receiveDate ?? "",
                      textTwo: widget.trackingData?.token ?? "",
                      textThree: widget.trackingData?.trackingNo ?? "-",
                      textColor: BLACK_LIGHT,
                    ),
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Container(
                          height: 0.3,
                          color: BLACK_HEAVY,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade100,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          TextRowView(
                            textOne: "Customer Name",
                            textTwo: "",
                            textThree: widget.trackingData?.customerName ?? "-",
                          ),
                          TextRowView(
                            textOne: "Customer Phone Number",
                            textTwo: "",
                            textThree:
                                widget.trackingData?.customerPhone ?? "-",
                          ),
                          TextRowView(
                            textOne: "Parcel Quantity",
                            textTwo: "",
                            textThree: widget.trackingData?.parcelQuantity
                                    ?.toString() ??
                                "-",
                          ),
                          TextRowView(
                            textOne: "Remark",
                            textTwo: "",
                            textThree: widget.trackingData?.remark ?? "-",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Container(
                          height: 0.3,
                          color: BLACK_HEAVY,
                        ),
                      ),
                    ),
                    Text(
                      "Tracking Order",
                      style: ConfigStyle.boldStyleThree(
                        DIMEN_FOURTEEN,
                        LOGIN_BUTTON_COLOR,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TrackSliderView(
                      currentValue: currentStatus.toDouble(),
                      gateList: gateList,
                    ),
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Container(
                          height: 0.3,
                          color: BLACK_HEAVY,
                        ),
                      ),
                    ),
                    PointSectionView(
                      location: widget.trackingData?.receivePoint ?? "-",
                      date: widget.trackingData?.receiveDate ?? "-",
                      status: widget.trackingData?.receiveStatus ?? "",
                      title: "Receive Point",
                    ),
                    PointSectionView(
                      location: widget.trackingData?.dropoffPoint ?? "-",
                      date: widget.trackingData?.mywayDate ?? "-",
                      status: widget.trackingData?.mywayStatus ?? "-",
                      title: "Drop Off Point",
                    ),
                    PointSectionView(
                      location: widget.trackingData?.customerAddress ?? "-",
                      date: widget.trackingData?.customerDate ?? "-",
                      status: widget.trackingData?.mywayStatus ?? "-",
                      title: "Customer Point",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
