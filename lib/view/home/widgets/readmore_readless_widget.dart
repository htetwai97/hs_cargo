import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';

class ReadMoreLessWidget extends StatefulWidget {
  final String title;
  final String text;
  final int maxLines, minLines;
  final bool visible;

  const ReadMoreLessWidget({
    Key? key,
    required this.title,
    required this.text,
    required this.maxLines,
    this.minLines = 2,
    this.visible = false,
  }) : super(key: key);

  @override
  State<ReadMoreLessWidget> createState() => _ReadMoreLessWidgetState();
}

class _ReadMoreLessWidgetState extends State<ReadMoreLessWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: ConfigStyle.boldStyleTwo(
            12,
            Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.text,
          style: ConfigStyle.regularStyleTwo(
            12,
            Colors.black,
          ),
          maxLines: !isExpanded ? widget.minLines : widget.maxLines,
          overflow: TextOverflow.ellipsis,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: widget.visible,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Card(
                            color: Colors.transparent,
                            child: Center(
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  SizedBox(
                                    width: scaleWidth(context) / 1.4,
                                    height: scaleHeight(context) / 1.6,
                                    child: Image.asset(
                                      "assets/images/rules.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      size: 24,
                                      color: BLACK_HEAVY,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Text(
                    "Document",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.purpleAccent,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? "Read Less" : "Read More",
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.purpleAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
