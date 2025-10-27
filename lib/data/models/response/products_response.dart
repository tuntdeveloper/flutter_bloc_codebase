import 'package:freezed_annotation/freezed_annotation.dart';
import '../product_model.dart';

part 'products_response.freezed.dart';
part 'products_response.g.dart';

@freezed
class ProductsResponse with _$ProductsResponse {
  const factory ProductsResponse({required bool success, required String message, required List<ProductModel> data}) =
      _ProductsResponse;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => _$ProductsResponseFromJson(json);
}
