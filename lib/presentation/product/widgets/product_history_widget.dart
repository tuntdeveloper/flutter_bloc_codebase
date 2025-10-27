import 'package:flutter/material.dart';
import 'timeline_widget.dart';
import 'attachment_widget.dart';

class ProductHistoryWidget extends StatelessWidget {
  final Color? backgroundColor;
  final List<TimelineItemData>? timelineItems;

  const ProductHistoryWidget({
    super.key,
    this.backgroundColor,
    this.timelineItems,
  });

  @override
  Widget build(BuildContext context) {
    // Default timeline items for demonstration
    final defaultItems = timelineItems ?? _getDefaultTimelineItems();

    return TimelineWidget(
      items: defaultItems,
      backgroundColor: backgroundColor,
      padding: EdgeInsets.only(top: 16),
    );
  }

  List<TimelineItemData> _getDefaultTimelineItems() {
    return [
      TimelineItemData(
        label: 'Label',
        title: 'Title',
        description: 'Description \nDescription',
        attachments: [
          const AttachmentWidget(),
          const AttachmentWidget(),
          const AttachmentWidget(),
        ],
      ),
      TimelineItemData(
        label: 'Label',
        title: 'Title',
        description: 'Description \nDescription',
        attachments: [
          const AttachmentWidget(),
          const AttachmentWidget(),
          const AttachmentWidget(),
        ],
      ),
    ];
  }
}
