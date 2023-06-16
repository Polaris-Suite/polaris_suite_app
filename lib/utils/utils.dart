import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';

class Utils {
  //flusbar
  static void flushbarErrorMessage(
      BuildContext context, String mssg, Color color) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        duration: const Duration(seconds: 2),
        message: mssg,
        backgroundColor: color,
        forwardAnimationCurve: Curves.bounceInOut,
        flushbarPosition: FlushbarPosition.TOP,
        reverseAnimationCurve: Curves.bounceInOut,
        borderRadius: BorderRadius.circular(4),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
      )..show(context),
    );
  }

  //focus for textfiels
  static void fieldFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
