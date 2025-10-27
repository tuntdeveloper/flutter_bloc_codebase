import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/widgets/youtube_video_widget.dart';

class TastingNoteItem extends StatelessWidget {
  final String category;
  final String description;

  const TastingNoteItem({
    super.key,
    required this.category,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.background,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: context.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              height: 1.33,
              letterSpacing: 0.05,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: context.bodyMedium?.copyWith(
              height: 1.50,
              letterSpacing: 0.08,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductTastingNotesWidget extends StatelessWidget {
  final List<TastingNoteData> tastingNotes;

  const ProductTastingNotesWidget({super.key, required this.tastingNotes});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: [
          YouTubeVideoWidget(
            videoUrl:
                'https://www.youtube.com/watch?v=LUjn3RpkcKY&list=RDLUjn3RpkcKY&start_radio=1',
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                'Tasting notes',
                style: context.titleMedium?.copyWith(
                  color: const Color(0xFFE7E9EA),
                  fontWeight: FontWeight.w500,
                  height: 1.27,
                ),
              ),
              Text(
                'by Charles MacLean MBE',
                style: context.bodyMedium?.copyWith(
                  color: const Color(0xFFB8BDBF),
                  height: 1.50,
                  letterSpacing: 0.08,
                ),
              ),
            ],
          ),
          ...tastingNotes
              .map(
                (note) => TastingNoteItem(
                  category: note.category,
                  description: note.description,
                ),
              )
              .toList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 4,
            children: [
              Text(
                'Your notes',
                style: context.titleMedium?.copyWith(
                  color: const Color(0xFFE7E9EA),
                  fontWeight: FontWeight.w500,
                  height: 1.27,
                ),
              ),
              Icon(Icons.arrow_back_rounded),
            ],
          ),
          ...tastingNotes
              .map(
                (note) => TastingNoteItem(
                  category: note.category,
                  description: note.description,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class TastingNoteData {
  final String category;
  final String description;

  const TastingNoteData({required this.category, required this.description});
}
