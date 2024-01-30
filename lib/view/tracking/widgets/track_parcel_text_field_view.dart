import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';

class TrackParcelTextFieldView extends StatelessWidget {
  final TextEditingController controller;
  final Function onTapSearch;
  final String hint;
  final int maxLine;
  final FocusNode focusNode;
  const TrackParcelTextFieldView({
    Key? key,
    required this.controller,
    this.hint = "Enter Token or phone number",
    this.maxLine = 1,
    required this.onTapSearch,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // onTap: () {
      //   focusNode.requestFocus();
      // },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter the reason';
        }
        return null;
      },
      maxLines: maxLine,
      // onEditingComplete: () {
      //   focusNode.unfocus();
      //   onTapSearch();
      // },
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: InkWell(
          onTap: () {
            //focusNode.unfocus();
            onTapSearch();
          },
          child: const Icon(Icons.search),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: hint,
        hintStyle: ConfigStyle.regularStyleTwo(
          DIMEN_FOURTEEN,
          BLACK_LIGHT,
        ),
      ),
    );
  }
}
