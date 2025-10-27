import 'package:flutter/material.dart';

class ProductImageHeader extends StatelessWidget {
  final String imagePath;
  final double height;

  const ProductImageHeader({super.key, required this.imagePath, this.height = 410});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}
