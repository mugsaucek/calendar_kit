import 'package:flutter/material.dart';

import 'package:calendar_kit/src/models/calendar_style_config.dart';

class DateDisplayField extends StatelessWidget {
  const DateDisplayField({
    super.key,
    required this.text,
    required this.isSelected,
    this.styleConfig,
  });

  final String text;
  final bool isSelected;
  final CalendarStyleConfig? styleConfig;

  @override
  Widget build(BuildContext context) {
    final config = styleConfig ?? CalendarStyleConfig.defaultStyle();

    final currentDecoration = isSelected
        ? config.dateDisplayFieldSelectedDecoration
        : config.dateDisplayFieldDecoration;

    final currentTextStyle = isSelected
        ? config.dateDisplayFieldSelectedTextStyle
        : config.dateDisplayFieldTextStyle;

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
