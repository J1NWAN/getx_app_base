import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_base/app/core/theme/theme_controller.dart';
import 'package:getx_app_base/app/core/utils/dialog_utils.dart';
import 'package:getx_app_base/app/core/widgets/buttons/custom_button.dart';
import 'package:getx_app_base/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX App Base'),
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(
                themeController.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              ),
              onPressed: themeController.toggleTheme,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                text: '공통 다이얼로그1',
                onPressed: () async {
                  // async 추가
                  final confirmed = await DialogUtils.showConfirm(
                    // await로 결과 기다림
                    title: '공통 다이얼로그1',
                    message: '공통 다이얼로그1',
                    confirmText: '확인',
                    cancelText: '취소',
                  );

                  if (confirmed ?? false) {
                    // 확인 버튼 눌렀을 때만
                    Get.snackbar(
                      '알림'.tr,
                      '처리가 완료되었습니다.'.tr,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                isFullWidth: false,
              ),
              CustomButton(
                text: '공통 다이얼로그2',
                onPressed: () {
                  DialogUtils.showLoading(message: '처리중...');
                  Future.delayed(const Duration(seconds: 2), () {
                    DialogUtils.hideLoading();
                    Get.snackbar(
                      '알림',
                      '처리가 완료되었습니다.',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  });
                },
                isFullWidth: false,
              ),
            ],
          )
        ],
      ),
    );
  }
}
