import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_base/app/core/widgets/dialogs/custom_date_picker.dart';
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

  // Bottom Date Picker
  static Future<void> showBottomDatePicker({
    DateTime? initialDate,
    DateTime? minimumDate,
    DateTime? maximumDate,
    Function(DateTime)? onDateTimeChanged,
    String? confirmText,
    String? cancelText,
  }) {
    return Get.bottomSheet(
      CustomDatePicker(
        initialDate: initialDate,
        minimumDate: minimumDate,
        maximumDate: maximumDate,
        onDateTimeChanged: onDateTimeChanged,
        confirmText: confirmText,
        cancelText: cancelText,
      ),
      isScrollControlled: true,
      enableDrag: true,
    );
  }
}
