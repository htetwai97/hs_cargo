import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';

class CommonTextFieldView extends StatelessWidget {
  final TextEditingController descriptionController;
  final Function onChanged;
  final String title, hint;
  final int maxLine;
  final double height;
  final bool enable;
  final bool isVisibleTitle;
  const CommonTextFieldView({
    Key? key,
    required this.descriptionController,
    required this.onChanged,
    this.title = "Description(Reason)",
    this.hint = "Enter Reason",
    this.maxLine = 24,
    this.height = 6,
    this.enable = true,
    this.isVisibleTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: isVisibleTitle,
            child: Text(
              title,
              style: ConfigStyle.boldStyleTwo(DIMEN_SIXTEEN, Colors.black87),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            enabled: enable,
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
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
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
      ),
    );
  }
}
