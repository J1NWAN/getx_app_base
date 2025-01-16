import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/loading_indicator.dart';

class LoadingDialog extends StatelessWidget {
  final String? message;

  const LoadingDialog({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: Get.theme.dialogBackgroundColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoadingIndicator(
                message: message ?? '로딩중...'.tr,
                color: Get.theme.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
