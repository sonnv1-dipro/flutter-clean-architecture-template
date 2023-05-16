import 'package:clean_architecture_template/resourse/res.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin DialogPage {
  Future<void> showConfirmAlert({
    required BuildContext context,
    String? title,
    String? message,
    String cancelButtonTitle = "Cancel",
    String agreeButtonTitle = "Agree",
    bool isCancelButtonVisible = true,
    bool isAgreeButtonVisible = true,
    VoidCallback? onCancelTap,
    VoidCallback? onAgreeTap,
    bool barrierDismissible = false,
    bool onWillPopEnable = true,
  }) async {
    Widget widget() {
      return AlertDialog(
        title: Text(title ?? ""),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message ?? ""),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: onCancelTap,
            child: Text(cancelButtonTitle),
          ),
          TextButton(
            onPressed: onAgreeTap,
            child: Text(agreeButtonTitle),
          ),
        ],
      );
    }

    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => onWillPopEnable,
        child: widget(),
      ),
    );
  }

  //show Custom Toast
  Future<void> showToast({
    required String message,
    Toast? totalLength,
    ToastGravity? gravity,
    Color? backgroundColor,
    Color? textColor,
    double? fontSize,
  }) async {
    Fluttertoast.showToast(
      msg: message,
      toastLength: totalLength ?? Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? Colors.black,
      textColor: textColor ?? Colors.white,
      fontSize: fontSize ?? 16.0,
    );
  }

  Future<void> showSnackbar({
    required BuildContext context,
    required String message,
    SnackBarAction? action,
    Duration? duration,
    Color? backgroundColor,
    double? fontSize,
  }) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Res.styles.bodySmall.copyWith(
            fontSize: fontSize,
          ),
        ),
        duration: duration ?? const Duration(seconds: 2),
        action: action,
        backgroundColor: backgroundColor ?? Colors.black,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
