import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:hs_cargo_customer_app/view/register_order/bloc/register_order_bloc.dart';
import 'package:hs_cargo_customer_app/view/register_order/widgets/common_text_field_view.dart';
import 'package:hs_cargo_customer_app/view/register_order/widgets/date_pick_section_row_view.dart';
import 'package:hs_cargo_customer_app/view/register_order/widgets/drop_down_widget_view.dart';
import 'package:hs_cargo_customer_app/view/register_order/widgets/pick_up_choice_radio_section_view.dart';
import 'package:hs_cargo_customer_app/view/register_order/widgets/yes_or_no_radio_button_view.dart';
import 'package:provider/provider.dart';

class RegisterOrderScreen extends StatelessWidget {
  const RegisterOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => RegisterOrderBloc(),
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.0,
              backgroundColor: Colors.deepPurple,
              centerTitle: true,
              title: Text(
                "Register Order(Way Plan)",
                style: ConfigStyle.regularStyleThree(
                  16,
                  MATERIAL_COLOR,
                ),
              ),
            ),
            body: Selector<RegisterOrderBloc, bool>(
              selector: (context, bloc) => bloc.isInUseLoading,
              builder: (context, isInUseLoading, child) => Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Consumer<RegisterOrderBloc>(
                          builder: (context, bloc, child) => Form(
                            key: bloc.customerNameFormKey,
                            child: CommonTextFieldView(
                              title: "Customer Name",
                              hint: "Enter Name",
                              maxLine: 1,
                              descriptionController:
                                  bloc.customerNameController,
                              onChanged: () {
                                bloc.customerNameValidate();
                              },
                            ),
                          ),
                        ),
                        Consumer<RegisterOrderBloc>(
                          builder: (context, bloc, child) => Form(
                            key: bloc.customerPhoneFormKey,
                            child: CommonTextFieldView(
                              title: "Customer Phone",
                              hint: "Enter Phone number",
                              maxLine: 1,
                              descriptionController:
                                  bloc.customerPhoneController,
                              onChanged: () {
                                bloc.customerPhoneValidate();
                              },
                            ),
                          ),
                        ),
                        Consumer<RegisterOrderBloc>(
                          builder: (context, bloc, child) => Form(
                            key: bloc.customerAddressFormKey,
                            child: CommonTextFieldView(
                              title: "Customer Address",
                              hint: "Enter Address",
                              maxLine: 1,
                              descriptionController:
                                  bloc.customerAddressController,
                              onChanged: () {
                                bloc.customerAddressValidate();
                              },
                            ),
                          ),
                        ),
                        Consumer<RegisterOrderBloc>(
                          builder: (context, bloc, child) => DropDownWidgetView(
                            title: "Receive Point",
                            list: bloc.locationList,
                            hintName: "Choose receive point",
                            onChange: (e) {
                              bloc.onChooseReceivePoint(e ?? "");
                            },
                          ),
                        ),
                        Consumer<RegisterOrderBloc>(
                          builder: (context, bloc, child) =>
                              DatePickSectionRowView(
                            title: "Receive Date",
                            selectedDate: bloc.receiveDate != ""
                                ? bloc.receiveDate
                                : "Choose Date",
                            onPickDate: (e) {
                              bloc.onChooseReceiveDate(e);
                            },
                          ),
                        ),
                        Consumer<RegisterOrderBloc>(
                          builder: (context, bloc, child) => DropDownWidgetView(
                            title: "Drop off Point",
                            list: bloc.locationList,
                            hintName: "Choose receive point",
                            onChange: (e) {
                              bloc.onChooseDropOffPoint(e ?? "");
                            },
                          ),
                        ),
                        Consumer<RegisterOrderBloc>(
                          builder: (context, bloc, child) => Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: scaleWidth(context) / 2.5,
                                child: CommonTextFieldView(
                                  enable: false,
                                  title: "Token",
                                  hint: "",
                                  maxLine: 1,
                                  descriptionController: bloc.tokenController,
                                  onChanged: () {},
                                ),
                              ),
                              const Spacer(),
                              MaterialButton(
                                color: APP_THEME_COLOR,
                                onPressed: () {
                                  if (bloc.isInUseLoading == false) {
                                    bloc.onTapGenerate(context);
                                  }
                                },
                                child: Text(
                                  "Generate",
                                  style: ConfigStyle.regularStyleOne(
                                    14,
                                    MATERIAL_COLOR,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16)
                            ],
                          ),
                        ),
                        Consumer<RegisterOrderBloc>(
                          builder: (context, bloc, child) => Form(
                            key: bloc.remarkFormKey,
                            child: CommonTextFieldView(
                              title: "Remark",
                              hint: "Enter remark",
                              maxLine: 1,
                              descriptionController: bloc.remarkController,
                              onChanged: () {
                                bloc.remarkValidate();
                              },
                            ),
                          ),
                        ),
                        Consumer<RegisterOrderBloc>(
                          builder: (context, bloc, child) => Form(
                            key: bloc.quantityFormKey,
                            child: CommonTextFieldView(
                              title: "Quantity",
                              hint: "Enter quantity",
                              maxLine: 1,
                              descriptionController: bloc.quantityController,
                              onChanged: () {
                                bloc.quantityValidate();
                              },
                            ),
                          ),
                        ),
                        Consumer<RegisterOrderBloc>(
                          builder: (context, bloc, child) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: scaleWidth(context) / 2.5,
                                child: Form(
                                  key: bloc.weightFormKey,
                                  child: CommonTextFieldView(
                                    title: "Specific Weight",
                                    hint: "Enter Weight",
                                    maxLine: 1,
                                    descriptionController:
                                        bloc.weightController,
                                    onChanged: () {
                                      bloc.weightValidate();
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: scaleWidth(context) / 2,
                                child: DropDownWidgetView(
                                  isUnit: true,
                                  title: "",
                                  list: ["KG"],
                                  hintName: "Choose Weight",
                                  onChange: (e) {
                                    bloc.onChooseWeightType(e ?? "");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Consumer<RegisterOrderBloc>(
                          builder: (context, bloc, child) =>
                              CommonTextFieldView(
                            enable: false,
                            title: "Charges",
                            hint: "Enter Charges",
                            maxLine: 1,
                            descriptionController: bloc.chargesController,
                            onChanged: () {
                              //bloc.chargesValidate();
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Consumer<RegisterOrderBloc>(
                          builder: (context, bloc, child) =>
                              PickupChoiceRadioSectionView(
                            onChoosePickupValue: (value) {
                              bloc.onChoosePickUpValue(value);
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Selector<RegisterOrderBloc, String>(
                          selector: (context, bloc) => bloc.pickUpValue,
                          builder: (context, pickupValue, child) => Visibility(
                            visible: pickupValue == "Yes",
                            child: const PickUpFormsSection(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Consumer<RegisterOrderBloc>(
                          builder: (context, bloc, child) => MaterialButton(
                            color: (bloc.isSubmitUnlock)
                                ? Colors.deepPurple
                                : Colors.grey.shade500,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            onPressed: () {
                              bloc.onTapSubmit().then((value) {
                                Functions.replacementTransition(
                                  context,
                                  const BottomNavigationScreen(),
                                );
                              });
                            },
                            child: Text(
                              "Submit",
                              style: ConfigStyle.regularStyleOne(
                                14,
                                MATERIAL_COLOR,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: isInUseLoading,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PickUpFormsSection extends StatelessWidget {
  const PickUpFormsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Choose Township",
              style: ConfigStyle.boldStyleTwo(DIMEN_SIXTEEN, Colors.black87),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Consumer<RegisterOrderBloc>(
          builder: (context, bloc, child) => DropDownWidgetView(
            isVisibleTitle: false,
            isUnit: true,
            title: "",
            list: bloc.townshipList,
            hintName: "Choose Township",
            onChange: (township) {
              bloc.onChooseTownship(township ?? "");
            },
          ),
        ),
        Consumer<RegisterOrderBloc>(
          builder: (context, bloc, child) => CommonTextFieldView(
            isVisibleTitle: false,
            enable: false,
            title: "",
            hint: "Township Charge",
            maxLine: 1,
            descriptionController: bloc.townshipChargeController,
            onChanged: () {},
          ),
        ),
        Consumer<RegisterOrderBloc>(
          builder: (context, bloc, child) => Form(
            key: bloc.contactNoFormKey,
            child: CommonTextFieldView(
              title: "Contact Number",
              hint: "Enter Contact number",
              maxLine: 1,
              descriptionController: bloc.contactNumberController,
              onChanged: () {
                bloc.contactNumberValidate();
              },
            ),
          ),
        ),
        Consumer<RegisterOrderBloc>(
          builder: (context, bloc, child) => Form(
            key: bloc.pickupAddressFormKey,
            child: CommonTextFieldView(
              title: "Pickup Address",
              hint: "Enter Pickup Address",
              maxLine: 1,
              descriptionController: bloc.pickupAddressController,
              onChanged: () {
                bloc.pickupAddressValidate();
              },
            ),
          ),
        ),
        Consumer<RegisterOrderBloc>(
          builder: (context, bloc, child) => DatePickSectionRowView(
            title: "Pickup Date",
            selectedDate:
                bloc.pickUpDate != "" ? bloc.pickUpDate : "Choose Date",
            onPickDate: (e) {
              bloc.onChoosePickupDate(e);
            },
          ),
        ),
        Consumer<RegisterOrderBloc>(
          builder: (context, bloc, child) => Form(
            key: bloc.pickupTimeFormKey,
            child: CommonTextFieldView(
              title: "Pickup Time",
              hint: "Enter Pickup time",
              maxLine: 1,
              descriptionController: bloc.pickupTimeController,
              onChanged: () {
                bloc.pickupTimeValidate();
              },
            ),
          ),
        ),
        Consumer<RegisterOrderBloc>(
          builder: (context, bloc, child) => CommonTextFieldView(
            enable: false,
            title: "Total Charges",
            hint: "total",
            maxLine: 1,
            descriptionController: bloc.totalChargeController,
            onChanged: () {},
          ),
        ),
      ],
    );
  }
}
