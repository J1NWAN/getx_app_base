import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/dialogs/confirm_dialog.dart';
import '../widgets/dialogs/loading_dialog.dart';

class DialogUtils {
  static Future<bool?> showConfirm({
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool isDismissible = true,
  }) {
    return Get.dialog<bool>(
      ConfirmDialog(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        isDismissible: isDismissible,
      ),
      barrierDismissible: isDismissible,
    );
  }

  static void showLoading({String? message}) {
    Get.dialog(
      LoadingDialog(message: message),
      barrierDismissible: false,
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
