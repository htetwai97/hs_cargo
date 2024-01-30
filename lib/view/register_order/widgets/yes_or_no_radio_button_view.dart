import 'package:flutter/material.dart';

class YesNoRadioButtons extends StatefulWidget {
  final Function(String) onChoosePickupValue;
  const YesNoRadioButtons({
    Key? key,
    required this.onChoosePickupValue,
  }) : super(key: key);

  @override
  State<YesNoRadioButtons> createState() => _YesNoRadioButtonsState();
}

class _YesNoRadioButtonsState extends State<YesNoRadioButtons> {
  String selectedOption = 'No';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Radio(
            value: 'Yes',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value ?? "";
                widget.onChoosePickupValue(selectedOption);
              });
            },
          ),
          const SizedBox(width: 10),
          const Text('Yes'),
          const SizedBox(width: 30),
          Radio(
            value: 'No',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value ?? "";
                widget.onChoosePickupValue(selectedOption);
              });
            },
          ),
          const Text('No'),
        ],
      ),
    );
  }
}
