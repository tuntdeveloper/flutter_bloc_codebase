import 'package:flutter_bloc_codebase/domain/entities/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = ProductInitial;
  const factory ProductState.loading() = ProductLoading;
  const factory ProductState.productsLoaded(List<ProductEntity> products) = ProductsLoaded;
  const factory ProductState.productLoaded(ProductEntity product) = ProductLoaded;
  const factory ProductState.error(String message) = ProductError;
}
