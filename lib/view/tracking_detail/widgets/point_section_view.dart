import 'package:flutter/cupertino.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/view/tracking_detail/widgets/point_text_box_view.dart';

class PointSectionView extends StatelessWidget {
  final String location, status, date, title;
  const PointSectionView({
    Key? key,
    required this.location,
    required this.date,
    required this.status,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: ConfigStyle.boldStyleThree(
            DIMEN_FOURTEEN,
            LOGIN_BUTTON_COLOR,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PointTextBoxView(
              text: location,
            ),
            PointTextBoxView(
              text: status,
            ),
            PointTextBoxView(
              text: date,
            ),
          ],
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
