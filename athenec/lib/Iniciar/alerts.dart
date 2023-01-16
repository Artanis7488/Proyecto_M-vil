import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GlobalDialog {
  static Future<bool?> showError(BuildContext context, String? title, String? desc, [void Function()? onTap]) {
    return Alert(
        context: context,
        type: AlertType.error,
        style: const AlertStyle(isButtonVisible: false, isCloseButton: false, isOverlayTapDismiss: false),
        title: title,
        desc: desc,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: onTap ?? Navigator.of(context).pop, child: const Text("ok"),),
        )
    ).show();
  }

  static Future<bool?> showWarning(BuildContext context, String? title, String? desc, [void Function()? onTap]) {
    return Alert(
        context: context,
        type: AlertType.warning,
        style: const AlertStyle(isButtonVisible: false, isCloseButton: false, isOverlayTapDismiss: false),
        title: title,
        desc: desc,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: onTap ?? Navigator.of(context).pop, child: const Text("ok"),),
        )
    ).show();
  }

  static Future<bool?> showSuccess(BuildContext context, String? title, String? desc, [void Function()? onTap]) {
    return Alert(
        context: context,
        type: AlertType.success,
        style: const AlertStyle(isButtonVisible: false, isCloseButton: false, isOverlayTapDismiss: false),
        title: title,
        desc: desc,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: onTap ?? Navigator.of(context).pop, child: const Text("ok"),),
        )
    ).show();
  }
}