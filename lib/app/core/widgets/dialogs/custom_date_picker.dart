import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime? initialDate;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final Function(DateTime)? onDateTimeChanged;
  final String? confirmText;
  final String? cancelText;

  const CustomDatePicker({
    super.key,
    this.initialDate,
    this.minimumDate,
    this.maximumDate,
    this.onDateTimeChanged,
    this.confirmText,
    this.cancelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: initialDate ?? DateTime.now(),
              minimumDate: minimumDate,
              maximumDate: maximumDate,
              onDateTimeChanged: (DateTime newDate) {
                if (onDateTimeChanged != null) {
                  onDateTimeChanged!(newDate);
                }
              },
              use24hFormat: true,
            ),
          ),
        ],
      ),
    );
  }
}
