import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/view/your_orders/bloc/your_orders_bloc.dart';
import 'package:hs_cargo_customer_app/view/your_orders/widgets/my_order_item_detail_view.dart';
import 'package:hs_cargo_customer_app/view/your_orders/widgets/show_dialog_text_row_widget.dart';
import 'package:provider/provider.dart';

class YourOrdersScreen extends StatelessWidget {
  const YourOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => YourOrdersBloc(),
          child: Scaffold(
            backgroundColor: MATERIAL_COLOR,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.0,
              backgroundColor: Colors.deepPurple,
              centerTitle: true,
              title: Text(
                "My Orders",
                style: ConfigStyle.regularStyleThree(
                  16,
                  MATERIAL_COLOR,
                ),
              ),
            ),
            body: Consumer<YourOrdersBloc>(builder: (context, bloc, child) {
              if (bloc.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (bloc.parcelList == null || bloc.parcelList?.length == 0) {
                  return Center(
                    child: Text(
                      "No Order Yet",
                      style: ConfigStyle.regularStyleThree(
                        18,
                        BLACK_HEAVY,
                      ),
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: MATERIAL_COLOR,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          Functions.buildBoxShadow(),
                        ],
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: bloc.parcelList?.length ?? 0,
                        itemBuilder: (context, index) {
                          return MyOrderItemDetailView(
                            token: bloc.parcelList?[index].token ?? "",
                            date: bloc.parcelList?[index].createdAt
                                    ?.substring(0, 10) ??
                                "",
                            onTapDetail: () {
                              var parcel = bloc.parcelList?[index];
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Card(
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 40),
                                            decoration: BoxDecoration(
                                              color: MATERIAL_COLOR,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              boxShadow: [
                                                Functions.buildBoxShadow(),
                                              ],
                                            ),
                                            width: scaleWidth(context) / 1.3,
                                            height: scaleHeight(context) / 1.9,
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 10),
                                                Text(
                                                  "Detail",
                                                  style: ConfigStyle
                                                      .regularStyleThree(
                                                    18,
                                                    BLACK_HEAVY,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                ShowDialogTextRowWidget(
                                                  title: "Customer Name",
                                                  value: parcel?.customerName ??
                                                      "",
                                                ),
                                                ShowDialogTextRowWidget(
                                                  title: "Customer Phone",
                                                  value:
                                                      parcel?.customerPhone ??
                                                          "",
                                                ),
                                                ShowDialogTextRowWidget(
                                                  title: "Customer Address",
                                                  value:
                                                      parcel?.customerAddress ??
                                                          "",
                                                ),
                                                ShowDialogTextRowWidget(
                                                  title: "Receive Point",
                                                  value: parcel?.receivePoint ??
                                                      "",
                                                ),
                                                ShowDialogTextRowWidget(
                                                  title: "Receive Date",
                                                  value:
                                                      parcel?.receiveDate ?? "",
                                                ),
                                                ShowDialogTextRowWidget(
                                                  title: "Drop off Point",
                                                  value: parcel?.dropoffPoint ??
                                                      "",
                                                ),
                                                //  ShowDialogTextRowWidget(
                                                //   title: "Drop off Date",
                                                //   value: "Htet Wai Lwin",
                                                // ),
                                                ShowDialogTextRowWidget(
                                                  title: "Token",
                                                  value: parcel?.token ?? "",
                                                ),
                                                ShowDialogTextRowWidget(
                                                  title: "Remark",
                                                  value: parcel?.remark ?? "",
                                                ),
                                                ShowDialogTextRowWidget(
                                                  title: "Quantity",
                                                  value: parcel?.parcelQuantity
                                                          .toString() ??
                                                      "",
                                                ),
                                                ShowDialogTextRowWidget(
                                                  title: "Weight",
                                                  value:
                                                      "${parcel?.totalWeight ?? ""} Kg",
                                                ),
                                                ShowDialogTextRowWidget(
                                                  title: "Charges",
                                                  value: parcel?.totalCharges
                                                          ?.toString() ??
                                                      "",
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                }
              }
            }),
          ),
        ),
      ),
    );
  }
}
