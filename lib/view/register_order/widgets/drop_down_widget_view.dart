import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DropDownWidgetView extends StatefulWidget {
  final String hintName, title;
  final List<String> list;
  final String? menuTitle;
  final Function(String?) onChange;
  final bool isUnit;
  final bool isVisibleTitle;
  const DropDownWidgetView({
    super.key,
    required this.list,
    required this.title,
    this.menuTitle,
    required this.hintName,
    required this.onChange,
    this.isUnit = false,
    this.isVisibleTitle = true,
  });

  @override
  State<DropDownWidgetView> createState() => _DropDownWidgetViewState();
}

class _DropDownWidgetViewState extends State<DropDownWidgetView> {
  String? dropdownValue;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        alignment: Alignment.centerLeft,
        value: item,
        child: Text(
          item,
          style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.isVisibleTitle,
            child: Text(
              widget.title,
              style: ConfigStyle.boldStyleTwo(DIMEN_SIXTEEN, Colors.black87),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: BLACK_LIGHT,
                width: 0.5,
              ),
            ),
            child: (widget.isUnit)
                ? DropdownButton<String>(
                    hint: Text(
                      widget.hintName,
                      style: ConfigStyle.regularStyleThree(14, BLACK_LIGHT),
                    ),
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    isDense: false,
                    isExpanded: false,
                    elevation: 0,
                    dropdownColor: Colors.white,
                    value: dropdownValue,
                    //?? widget.list?[0],
                    items: widget.list.map(buildMenuItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value;
                      });
                      widget.onChange(value);
                    },
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton<String>(
                        hint: Text(
                          widget.hintName,
                          style: ConfigStyle.regularStyleThree(14, BLACK_LIGHT),
                        ),
                        underline: Container(
                          color: Colors.transparent,
                        ),
                        isDense: false,
                        isExpanded: false,
                        elevation: 0,
                        dropdownColor: Colors.white,
                        value: dropdownValue,
                        //?? widget.list?[0],
                        items: widget.list.map(buildMenuItem).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdownValue = value;
                          });
                          widget.onChange(value);
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(MdiIcons.send),
                      ),
                    ],
                  ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
