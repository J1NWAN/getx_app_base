import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/theme_controller.dart';

class ThemeTestPage extends StatelessWidget {
  const ThemeTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('테마 테스트'),
        actions: [
          Obx(() => IconButton(
                icon: Icon(
                  themeController.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                ),
                onPressed: themeController.toggleTheme,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '제목',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '부제목',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '일반 텍스트입니다. 테마에 따라 색상이 자동으로 변경됩니다.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  '알림',
                  '현재 테마: ${themeController.isDarkMode ? "다크" : "라이트"}',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text('현재 테마 확인'),
            ),
          ],
        ),
      ),
    );
  }
}
