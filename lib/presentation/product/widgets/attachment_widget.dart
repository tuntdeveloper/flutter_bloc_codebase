import 'package:flutter/material.dart';

class AttachmentWidget extends StatelessWidget {
  final String? imageUrl;
  final Widget? child;
  final double width;
  final double height;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  const AttachmentWidget({
    super.key,
    this.imageUrl,
    this.child,
    this.width = 64,
    this.height = 64,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFD9D9D9),
        borderRadius: borderRadius ?? BorderRadius.circular(4),
      ),
      child:
          child ??
          (imageUrl != null
              ? ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.circular(4),
                  child: Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: backgroundColor ?? const Color(0xFFD9D9D9),
                        child: const Icon(Icons.image_not_supported, color: Colors.grey),
                      );
                    },
                  ),
                )
              : null),
    );
  }
}
