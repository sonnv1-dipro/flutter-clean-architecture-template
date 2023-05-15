import 'package:flutter/material.dart';

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

  Future<void> showToast() async {}

  Future<void> showSnackbar() async {}
}
