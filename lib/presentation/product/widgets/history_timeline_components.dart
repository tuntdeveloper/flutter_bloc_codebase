import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';

class TimelineConnector extends StatelessWidget {
  final bool isLast;
  final double height;

  const TimelineConnector({super.key, this.isLast = false, this.height = 200});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 15,
          top: 20,
          child: Stack(
            children: [
              Positioned(
                left: 1,
                top: isLast ? -36 : 0,
                child: Container(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(1.57),
                  width: isLast ? 236 : 216,
                  height: 1,
                  child: Stack(
                    children: [Positioned(left: 0, top: 0, child: Container(width: 1, height: isLast ? 236 : 216))],
                  ),
                ),
              ),
              Positioned(
                left: 6,
                top: 85,
                child: Container(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(2.34),
                  width: 14.34,
                  decoration: BoxDecoration(color: context.primaryColor),
                ),
              ),
              Positioned(
                left: 3,
                top: 75,
                child: Container(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(2.34),
                  width: 5.56,
                  decoration: BoxDecoration(color: context.primaryColor),
                ),
              ),
              Positioned(
                left: 3,
                top: 100.44,
                child: Container(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(2.34),
                  width: 5.56,
                  decoration: BoxDecoration(color: context.primaryColor),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 4,
          top: 8,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: ShapeDecoration(color: Colors.white, shape: OvalBorder()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TimelineItem extends StatelessWidget {
  final String label;
  final String title;
  final String description;
  final List<String> attachments;

  const TimelineItem({
    super.key,
    required this.label,
    required this.title,
    required this.description,
    this.attachments = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            label,
            style: context.labelSmall?.copyWith(color: const Color(0xFFE7E9EA), height: 1.33, letterSpacing: 0.05),
          ),
          Text(
            title,
            style: context.titleMedium?.copyWith(
              color: const Color(0xFFE7E9EA),
              fontWeight: FontWeight.w500,
              height: 1.27,
            ),
          ),
          Text(
            description,
            style: context.bodyMedium?.copyWith(color: const Color(0xFFE7E9EA), height: 1.50, letterSpacing: 0.08),
          ),
          if (attachments.isNotEmpty) _buildAttachments(context),
        ],
      ),
    );
  }

  Widget _buildAttachments(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Color(0xFF0B1519)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Icon(Icons.attach_file_rounded),
              Text(
                'Attachments',
                textAlign: TextAlign.right,
                style: context.labelSmall?.copyWith(color: const Color(0xFFE7E9EA), height: 1.33, letterSpacing: 0.05),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: attachments
                .take(3)
                .map((_) => Container(width: 64, height: 64, decoration: const BoxDecoration(color: Color(0xFFD9D9D9))))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class HistoryTimelineItem extends StatelessWidget {
  final String label;
  final String title;
  final String description;
  final List<String> attachments;
  final bool isLast;

  const HistoryTimelineItem({
    super.key,
    required this.label,
    required this.title,
    required this.description,
    this.attachments = const [],
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Color(0xFF0E1C21)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Container(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24,
              children: [
                TimelineConnector(isLast: isLast),
                TimelineItem(label: label, title: title, description: description, attachments: attachments),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryTimelineData {
  final String label;
  final String title;
  final String description;
  final List<String> attachments;

  const HistoryTimelineData({
    required this.label,
    required this.title,
    required this.description,
    this.attachments = const [],
  });
}
