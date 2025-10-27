import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';

class ProductTitleSection extends StatelessWidget {
  final String bottleNumber;
  final String brandName;
  final String ageStatement;
  final String bottleNumberSuffix;
  final Color? brandNameColor;
  final Color? ageStatementColor;
  final Color? bottleNumberColor;

  const ProductTitleSection({
    super.key,
    required this.bottleNumber,
    required this.brandName,
    required this.ageStatement,
    required this.bottleNumberSuffix,
    this.brandNameColor,
    this.ageStatementColor,
    this.bottleNumberColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          bottleNumber,
          style: context.labelSmall?.copyWith(color: const Color(0xFFB8BDBF), height: 1.33, letterSpacing: 0.05),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$brandName ',
                style: context.headlineSmall?.copyWith(
                  color: brandNameColor ?? const Color(0xFFE7E9EA),
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
              TextSpan(
                text: '$ageStatement ',
                style: context.headlineSmall?.copyWith(
                  color: ageStatementColor ?? context.primaryColor,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
        Text(
          bottleNumberSuffix,
          style: context.headlineSmall?.copyWith(
            color: bottleNumberColor ?? const Color(0xFFE7E9EA),
            fontWeight: FontWeight.w500,
            height: 1.25,
          ),
        ),
      ],
    );
  }
}
