import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';

class DescriptionTextFieldView extends StatelessWidget {
  final TextEditingController descriptionController;
  final Function onChanged;
  final String title, hint;
  final int maxLine;
  final double height;
  final bool isNumber;
  const DescriptionTextFieldView({
    Key? key,
    required this.descriptionController,
    required this.onChanged,
    this.title = "Description(Reason)",
    this.hint = "Enter Reason",
    this.maxLine = 24,
    this.height = 6,
    this.isNumber = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: ConfigStyle.regularStyleTwo(14, Colors.black87),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: (isNumber)?TextInputType.number:TextInputType.text,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter the reason';
            }
            return null;
          },
          maxLines: maxLine,
          onChanged: (text) {
            onChanged();
          },
          controller: descriptionController,
          decoration: InputDecoration(
            isDense: true,
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
        ),
      ],
    );
  }
}
