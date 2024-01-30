import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';

class TrackSliderView extends StatelessWidget {
  final double currentValue;
  final List<String> gateList;
  const TrackSliderView({
    super.key,
    required this.gateList,
    required this.currentValue,
  });

  Widget buildLabel({
    required String label,
  }) =>
      SizedBox(
        width: 30,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ).copyWith(color: BLACK_HEAVY),
        ),
      );

  @override
  Widget build(BuildContext context) {
    const double thumbRadius = 7;
    const double tickMarkRadius = 3;
    const activeColor = Color.fromRGBO(255, 0, 77, 1);
    const inactiveColor = Color.fromRGBO(109, 114, 120, 1);
    return SliderTheme(
      data: const SliderThemeData(
        trackHeight: 1,
        thumbShape: RoundSliderThumbShape(
          disabledThumbRadius: thumbRadius,
          enabledThumbRadius: thumbRadius,
        ),
        rangeThumbShape: RoundRangeSliderThumbShape(
          disabledThumbRadius: thumbRadius,
          enabledThumbRadius: thumbRadius,
        ),
        tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: tickMarkRadius),
        inactiveTickMarkColor: inactiveColor,
        inactiveTrackColor: inactiveColor,
        thumbColor: activeColor,
        activeTrackColor: activeColor,
        activeTickMarkColor: activeColor,
      ),
      child: Column(
        children: [
          Slider(
            activeColor: Colors.deepOrange,
            onChanged: (e) {},
            value: currentValue,
            max: gateList.length - 1,
            min: 0,
            divisions: gateList.length - 1,
            label: gateList[currentValue.toInt()].toString(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Functions.modelBuilder(
                gateList,
                (index, label) {
                  return buildLabel(label: label);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
