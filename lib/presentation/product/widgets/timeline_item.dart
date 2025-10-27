import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';

class TimelineItem extends StatelessWidget {
  final String label;
  final String title;
  final String description;
  final List<Widget>? attachments;
  final bool isLast;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? circleColor;
  final Color? lineColor;

  const TimelineItem({
    super.key,
    required this.label,
    required this.title,
    required this.description,
    this.attachments,
    this.isLast = false,
    this.backgroundColor,
    this.textColor,
    this.circleColor,
    this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextColor = textColor ?? const Color(0xFFE7E9EA);
    final defaultBackgroundColor = backgroundColor ?? const Color(0xFF0E1C21);
    final defaultCircleColor = circleColor ?? Colors.white;
    final defaultLineColor = lineColor ?? context.colorScheme.primary;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(color: defaultBackgroundColor),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVerticalLine(defaultCircleColor, defaultLineColor, context),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: context.labelSmall?.copyWith(color: defaultTextColor, height: 1.33, letterSpacing: 0.05),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: context.titleMedium?.copyWith(
                      color: defaultTextColor,
                      fontWeight: FontWeight.w500,
                      height: 1.27,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: context.bodyMedium?.copyWith(color: defaultTextColor, height: 1.50, letterSpacing: 0.08),
                  ),
                  if (attachments != null && attachments!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _AttachmentSection(attachments: attachments!),
                  ],
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalLine(Color defaultCircleColor, Color defaultLineColor, BuildContext context) {
    return SizedBox(
      width: 32,
      child: Column(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(color: defaultCircleColor, shape: BoxShape.circle),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    width: 1,
                    decoration: BoxDecoration(color: defaultLineColor, borderRadius: BorderRadius.circular(1)),
                  ),
                ),
                Positioned(
                  right: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 12,
                    children: [
                      Container(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(0.77),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(color: context.colorScheme.primary),
                      ),
                      Container(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(0.77),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(color: context.colorScheme.primary),
                      ),
                      Container(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(0.77),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(color: context.colorScheme.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AttachmentSection extends StatelessWidget {
  final List<Widget> attachments;

  const _AttachmentSection({required this.attachments});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Color(0xFF0B1519)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 6,
            children: [
              Icon(Icons.attach_file_rounded, size: 16),
              Text(
                'Attachments',
                style: context.labelSmall?.copyWith(color: const Color(0xFFE7E9EA), height: 1.33, letterSpacing: 0.05),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(spacing: 8, runSpacing: 8, children: attachments),
        ],
      ),
    );
  }
}
