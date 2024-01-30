import 'dart:convert';
import 'dart:ui' as ui;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/view/confirm_receive/widgets/description_text_field_view.dart';
import 'package:hs_cargo_customer_app/view/your_orders/widgets/show_dialog_text_row_widget.dart';

class ConfirmReceiveScreen extends StatefulWidget {
  const ConfirmReceiveScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmReceiveScreen> createState() => _ConfirmReceiveScreenState();
}

class _ConfirmReceiveScreenState extends State<ConfirmReceiveScreen> {
  ByteData _img = ByteData(0);
  var color = Colors.black;
  var strokeWidth = 3.0;
  final _sign = GlobalKey<SignatureState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MATERIAL_COLOR,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple.shade300,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: MATERIAL_COLOR,
            ),
          ),
          title: Text(
            "Confirm Receive",
            style: ConfigStyle.regularStyleThree(
              14,
              MATERIAL_COLOR,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                ShowDialogTextRowWidget(title: "Token No", value: "234564"),
                const SizedBox(height: 20),
                ShowDialogTextRowWidget(title: "Name", value: "Htet Wai Lwin"),
                const SizedBox(height: 20),
                ShowDialogTextRowWidget(title: "Phone", value: "09765520310"),
                const SizedBox(height: 20),
                ShowDialogTextRowWidget(
                    title: "Address",
                    value: "No.192,aung thiri st,myoe thit,dawpon,yangon"),
                const SizedBox(height: 20),
                ShowDialogTextRowWidget(title: "Total KG", value: "10"),
                const SizedBox(height: 20),
                ShowDialogTextRowWidget(
                    title: "Collect Amount", value: "100000"),
                const SizedBox(height: 20),
                ShowDialogTextRowWidget(
                    title: "Delivery charges", value: "1000"),
                const SizedBox(height: 20),
                DescriptionTextFieldView(
                  isNumber: true,
                  maxLine: 1,
                  title: "Receive amount",
                  hint: "Enter receive amount",
                  descriptionController: TextEditingController(),
                  onChanged: (e) {},
                ),
                const SizedBox(height: 20),
                DescriptionTextFieldView(
                  isNumber: true,
                  maxLine: 1,
                  title: "Return amount",
                  hint: "Enter return amount",
                  descriptionController: TextEditingController(),
                  onChanged: (e) {},
                ),
                const SizedBox(height: 20),
                DescriptionTextFieldView(
                  maxLine: 1,
                  title: "Remark",
                  hint: "Enter remark",
                  descriptionController: TextEditingController(),
                  onChanged: (e) {},
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Receive info",
                      style: ConfigStyle.regularStyleTwo(14, BLACK_HEAVY),
                    ),
                    MaterialButton(
                      color: Colors.white70,
                      onPressed: () async {
                        var result = await FilePicker.platform.pickFiles(
                          type: FileType.image,
                          allowMultiple: false,
                        );
                        var platFormFile = result?.files.first;
                        if (platFormFile != null) {
                          // bloc.onChosenFile(
                          //   File(platFormFile.path ?? ""),
                          // );
                        }
                      },
                      child: Text(
                        "Choose File",
                        style: ConfigStyle.regularStyleTwo(
                          14,
                          BLACK_HEAVY,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                  child: Center(
                    child: Container(
                      height: 0.4,
                      color: BLACK_LIGHT,
                    ),
                  ),
                ),
                Text(
                  "Draw Signature",
                  style: ConfigStyle.regularStyleTwo(
                    14,
                    BLACK_HEAVY,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: scaleHeight(context) / 4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                        blurRadius: 10,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Signature(
                      color: color,
                      key: _sign,
                      onSign: () {
                        final sign = _sign.currentState;
                        debugPrint(
                            '${sign?.points.length} points in the signature');
                      },
                      strokeWidth: strokeWidth,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _img.buffer.lengthInBytes == 0
                    ? Container()
                    : Row(
                        children: [
                          Text(
                            "Your Signature",
                            style: ConfigStyle.regularStyleTwo(
                              14,
                              BLACK_HEAVY,
                            ),
                          ),
                          LimitedBox(
                            maxHeight: 70.0,
                            child: Image.memory(
                              _img.buffer.asUint8List(),
                            ),
                          ),
                        ],
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      color: Colors.white70,
                      onPressed: () {
                        final sign = _sign.currentState;
                        sign?.clear();
                        setState(() {
                          _img = ByteData(0);
                        });
                        debugPrint("cleared");
                      },
                      child: Text(
                        "Clear",
                        style: ConfigStyle.regularStyleTwo(
                          14,
                          BLACK_HEAVY,
                        ),
                      ),
                    ),
                    MaterialButton(
                      color: Colors.white70,
                      onPressed: () async {
                        final sign = _sign.currentState;
                        final image = await sign?.getData();
                        var data = await image?.toByteData(
                            format: ui.ImageByteFormat.png);
                        sign?.clear();
                        final encoded =
                            base64.encode(data!.buffer.asUint8List());
                        setState(() {
                          _img = data;
                        });
                        debugPrint("onPressed $encoded");
                      },
                      child: Text(
                        "Done",
                        style: ConfigStyle.regularStyleTwo(
                          14,
                          BLACK_HEAVY,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                  child: Center(
                    child: Container(
                      height: 0.4,
                      color: BLACK_LIGHT,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple.shade200)),
                    onPressed: () {},
                    child: Text(
                      "Submit",
                      style: ConfigStyle.regularStyleThree(14, MATERIAL_COLOR),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
