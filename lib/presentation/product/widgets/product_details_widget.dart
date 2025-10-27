import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';

class ProductDetailItem extends StatelessWidget {
  final String label;
  final String value;
  final Color? labelColor;
  final Color? valueColor;

  const ProductDetailItem({super.key, required this.label, required this.value, this.labelColor, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.bodyMedium?.copyWith(color: labelColor ?? Colors.white, height: 1.50, letterSpacing: 0.08),
        ),
        Text(
          value,
          style: context.bodyMedium?.copyWith(
            color: valueColor ?? const Color(0xFFB8BDBF),
            height: 1.50,
            letterSpacing: 0.08,
          ),
        ),
      ],
    );
  }
}

class ProductDetailsWidget extends StatelessWidget {
  final List<ProductDetailItemData> details;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final double? spacing;

  const ProductDetailsWidget({super.key, required this.details, this.backgroundColor, this.padding, this.spacing});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? context.colorScheme.surface,
      padding: padding ?? const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: spacing ?? 24,
        children: details
            .map(
              (detail) => ProductDetailItem(
                label: detail.label,
                value: detail.value,
                labelColor: detail.labelColor,
                valueColor: detail.valueColor,
              ),
            )
            .toList(),
      ),
    );
  }
}

class ProductDetailItemData {
  final String label;
  final String value;
  final Color? labelColor;
  final Color? valueColor;

  const ProductDetailItemData({required this.label, required this.value, this.labelColor, this.valueColor});
}
