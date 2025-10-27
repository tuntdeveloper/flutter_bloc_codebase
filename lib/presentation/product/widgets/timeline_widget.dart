import 'package:flutter/material.dart';
import 'timeline_item.dart';

class TimelineWidget extends StatelessWidget {
  final List<TimelineItemData> items;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? circleColor;
  final Color? lineColor;
  final EdgeInsets? padding;

  const TimelineWidget({
    super.key,
    required this.items,
    this.backgroundColor,
    this.textColor,
    this.circleColor,
    this.lineColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFF0E1C21),
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isLast = index == items.length - 1;

          return TimelineItem(
            label: item.label,
            title: item.title,
            description: item.description,
            attachments: item.attachments,
            isLast: isLast,
            backgroundColor: backgroundColor,
            textColor: textColor,
            circleColor: circleColor,
            lineColor: lineColor,
          );
        }).toList(),
      ),
    );
  }
}

class TimelineItemData {
  final String label;
  final String title;
  final String description;
  final List<Widget>? attachments;

  const TimelineItemData({
    required this.label,
    required this.title,
    required this.description,
    this.attachments,
  });
}
