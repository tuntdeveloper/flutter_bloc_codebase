import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required int id,
    required String name,
    required String description,
    required double price,
    required String imageUrl,
    required String category,
    required double alcoholPercentage,
    required String origin,
  }) = _ProductEntity;
}
