import 'package:flutter/material.dart';

class DateDisplayField extends StatelessWidget {
  const DateDisplayField({
    super.key,
    required this.text,
    required this.isSelected,
    this.decoration,
    this.selectedDecoration,
    this.textStyle,
    this.selectedTextStyle,
  });

  final String text;
  final bool isSelected;
  final BoxDecoration? decoration;
  final BoxDecoration? selectedDecoration;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;

  @override
  Widget build(BuildContext context) {
    final defaultDecoration = BoxDecoration(
      border: Border.all(color: const Color(0xffE2E8F0)),
      borderRadius: BorderRadius.circular(12),
    );

    final defaultSelectedDecoration = BoxDecoration(
      border: Border.all(color: const Color(0xff556EE6)),
      borderRadius: BorderRadius.circular(12),
    );

    final defaultTextStyle = const TextStyle(
      color: Color(0xff79747E),
    );

    final defaultSelectedTextStyle = const TextStyle(
      color: Color(0xff000000),
    );

    final currentDecoration =
        isSelected ? (selectedDecoration ?? defaultSelectedDecoration) : (decoration ?? defaultDecoration);

    final currentTextStyle =
        isSelected ? (selectedTextStyle ?? defaultSelectedTextStyle) : (textStyle ?? defaultTextStyle);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
      decoration: currentDecoration,
      child: Center(
        child: Text(
          text,
          style: currentTextStyle,
        ),
      ),
    );
  }
}
