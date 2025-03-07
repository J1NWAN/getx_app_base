import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../buttons/custom_button.dart';

// 입력 필드의 속성을 정의하는 클래스
class InputField {
  final String label; // 입력 필드의 레이블
  final String? hintText; // 입력 필드의 힌트 텍스트
  final String? initialValue; // 초기 값
  final TextInputType? keyboardType; // 키보드 타입
  final bool isRequired; // 필수 입력 여부
  final bool obscureText; // 텍스트 숨김 여부 (비밀번호 등)
  final bool showPasswordToggle; // 비밀번호 표시/숨김 토글 버튼 표시 여부

  InputField({
    required this.label,
    this.hintText,
    this.initialValue,
    this.keyboardType,
    this.isRequired = false,
    this.obscureText = false,
    this.showPasswordToggle = false,
  });
}

// 사용자 입력을 받기 위한 다이얼로그 위젯
class InputDialog extends StatelessWidget {
  final String title; // 다이얼로그 제목
  final String? message; // 다이얼로그 메시지
  final List<InputField> fields; // 입력 필드 목록
  final String? confirmText; // 확인 버튼 텍스트
  final String? cancelText; // 취소 버튼 텍스트
  final bool isDismissible; // 다이얼로그 외부 터치로 닫기 가능 여부
  final VoidCallback? onConfirm; // 확인 버튼 콜백
  final VoidCallback? onCancel; // 취소 버튼 콜백

  // 입력 필드들의 컨트롤러 목록
  final List<TextEditingController> _controllers = [];
  // 비밀번호 표시/숨김 상태 관리 목록
  final List<RxBool> _obscureTextList = [];

  InputDialog({
    super.key,
    required this.title,
    this.message,
    required this.fields,
    this.confirmText,
    this.cancelText,
    this.isDismissible = true,
    this.onConfirm,
    this.onCancel,
  }) {
    for (var field in fields) {
      _controllers.add(TextEditingController(text: field.initialValue ?? ''));
      _obscureTextList.add(field.obscureText.obs);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(message!),
              ),
            ...List.generate(
              fields.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Obx(
                  () => TextField(
                    controller: _controllers[index],
                    keyboardType: fields[index].keyboardType,
                    obscureText: _obscureTextList[index].value,
                    decoration: InputDecoration(
                      labelText: fields[index].label,
                      hintText: fields[index].hintText,
                      border: const OutlineInputBorder(),
                      suffixIcon: fields[index].showPasswordToggle
                          ? IconButton(
                              icon: Icon(
                                _obscureTextList[index].value ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                _obscureTextList[index].value = !_obscureTextList[index].value;
                              },
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: cancelText?.tr ?? '취소'.tr,
                onPressed: () {
                  if (onCancel != null) onCancel!();
                  Get.back(result: null);
                },
                backgroundColor: Colors.grey[300],
                textColor: Colors.black87,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomButton(
                text: confirmText?.tr ?? '저장'.tr,
                onPressed: () {
                  if (onConfirm != null) onConfirm!();
                  Get.back(
                    result: _controllers.map((c) => c.text).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
