import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Functions {
  static void transition(context, Widget screen, [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.push(context,
          PageTransition(child: screen, type: PageTransitionType.fade));
    });
  }

  static void bottomTopUp(context, Widget screen, [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.push(context,
          PageTransition(child: screen, type: PageTransitionType.bottomToTop));
    });
  }

  static void rightToLeftTransition(context, Widget screen,
      [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.push(context,
          PageTransition(child: screen, type: PageTransitionType.rightToLeft));
    });
  }

  static void replace(context, Widget screen, [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      Navigator.removeRoute(context,
          PageTransition(child: screen, type: PageTransitionType.fade));
    });
  }

  static void replacementTransition(context, Widget screen,
      [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.pushReplacement(
        context,
        PageTransition(child: screen, type: PageTransitionType.fade),
      );
    });
  }

  static toast({String? msg, bool status = true}) {
    return Fluttertoast.showToast(
        msg: msg.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: status ? BLACK_LIGHT : Colors.red,
        textColor: MATERIAL_COLOR,
        fontSize: 16.0);
  }

  static buildBoxShadow() {
    return const BoxShadow(
      color: Colors.black12,
      offset: Offset(2, 2),
      spreadRadius: 0.3,
      blurRadius: 10,
      blurStyle: BlurStyle.outer,
    );
  }

  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  static void logoutDialog(
      BuildContext context,
      double height,
      Function onTapFirst,
      Function onTapSecond,
      String title,
      String content,
      String firstButtonName,
      String secondButtonName) async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: MATERIAL_COLOR,
          title: Text(
            title,
            style: ConfigStyle.regularStyleThree(20, BLACK_HEAVY),
          ),
          content: Text(
            content,
            style: ConfigStyle.regularStyleOne(18, BLACK_HEAVY),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onTapFirst();
              },
              child: Text(
                firstButtonName,
                style: ConfigStyle.regularStyleThree(18, CARD_FIRST_COLOR),
              ),
            ),
            TextButton(
              onPressed: () {
                onTapSecond();
              },
              child: Text(
                secondButtonName,
                style: ConfigStyle.regularStyleThree(18, CARD_FIRST_COLOR),
              ),
            ),
          ],
        );
      },
    );
  }

  static void tokenDialog(
    BuildContext context,
    double height,
    Function onTapFirst,
    String title,
    String content,
    String firstButtonName,
  ) async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: MATERIAL_COLOR,
          title: Text(
            title,
            style: ConfigStyle.regularStyleThree(20, BLACK_HEAVY),
          ),
          content: Text(
            content,
            style: ConfigStyle.regularStyleOne(18, BLACK_HEAVY),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onTapFirst();
              },
              child: Text(
                firstButtonName,
                style: ConfigStyle.regularStyleThree(18, CARD_FIRST_COLOR),
              ),
            ),
          ],
        );
      },
    );
  }
}
