// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function(int id) loadProductById,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function(int id)? loadProductById,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function(int id)? loadProductById,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductsEvent value) loadProducts,
    required TResult Function(LoadProductByIdEvent value) loadProductById,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductsEvent value)? loadProducts,
    TResult? Function(LoadProductByIdEvent value)? loadProductById,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductsEvent value)? loadProducts,
    TResult Function(LoadProductByIdEvent value)? loadProductById,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEventCopyWith<$Res> {
  factory $ProductEventCopyWith(
    ProductEvent value,
    $Res Function(ProductEvent) then,
  ) = _$ProductEventCopyWithImpl<$Res, ProductEvent>;
}

/// @nodoc
class _$ProductEventCopyWithImpl<$Res, $Val extends ProductEvent>
    implements $ProductEventCopyWith<$Res> {
  _$ProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadProductsEventImplCopyWith<$Res> {
  factory _$$LoadProductsEventImplCopyWith(
    _$LoadProductsEventImpl value,
    $Res Function(_$LoadProductsEventImpl) then,
  ) = __$$LoadProductsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadProductsEventImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$LoadProductsEventImpl>
    implements _$$LoadProductsEventImplCopyWith<$Res> {
  __$$LoadProductsEventImplCopyWithImpl(
    _$LoadProductsEventImpl _value,
    $Res Function(_$LoadProductsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadProductsEventImpl implements LoadProductsEvent {
  const _$LoadProductsEventImpl();

  @override
  String toString() {
    return 'ProductEvent.loadProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadProductsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function(int id) loadProductById,
  }) {
    return loadProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function(int id)? loadProductById,
  }) {
    return loadProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function(int id)? loadProductById,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductsEvent value) loadProducts,
    required TResult Function(LoadProductByIdEvent value) loadProductById,
  }) {
    return loadProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductsEvent value)? loadProducts,
    TResult? Function(LoadProductByIdEvent value)? loadProductById,
  }) {
    return loadProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductsEvent value)? loadProducts,
    TResult Function(LoadProductByIdEvent value)? loadProductById,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts(this);
    }
    return orElse();
  }
}

abstract class LoadProductsEvent implements ProductEvent {
  const factory LoadProductsEvent() = _$LoadProductsEventImpl;
}

/// @nodoc
abstract class _$$LoadProductByIdEventImplCopyWith<$Res> {
  factory _$$LoadProductByIdEventImplCopyWith(
    _$LoadProductByIdEventImpl value,
    $Res Function(_$LoadProductByIdEventImpl) then,
  ) = __$$LoadProductByIdEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$LoadProductByIdEventImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$LoadProductByIdEventImpl>
    implements _$$LoadProductByIdEventImplCopyWith<$Res> {
  __$$LoadProductByIdEventImplCopyWithImpl(
    _$LoadProductByIdEventImpl _value,
    $Res Function(_$LoadProductByIdEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$LoadProductByIdEventImpl(
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$LoadProductByIdEventImpl implements LoadProductByIdEvent {
  const _$LoadProductByIdEventImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ProductEvent.loadProductById(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProductByIdEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProductByIdEventImplCopyWith<_$LoadProductByIdEventImpl>
  get copyWith =>
      __$$LoadProductByIdEventImplCopyWithImpl<_$LoadProductByIdEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function(int id) loadProductById,
  }) {
    return loadProductById(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function(int id)? loadProductById,
  }) {
    return loadProductById?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function(int id)? loadProductById,
    required TResult orElse(),
  }) {
    if (loadProductById != null) {
      return loadProductById(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductsEvent value) loadProducts,
    required TResult Function(LoadProductByIdEvent value) loadProductById,
  }) {
    return loadProductById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductsEvent value)? loadProducts,
    TResult? Function(LoadProductByIdEvent value)? loadProductById,
  }) {
    return loadProductById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductsEvent value)? loadProducts,
    TResult Function(LoadProductByIdEvent value)? loadProductById,
    required TResult orElse(),
  }) {
    if (loadProductById != null) {
      return loadProductById(this);
    }
    return orElse();
  }
}

abstract class LoadProductByIdEvent implements ProductEvent {
  const factory LoadProductByIdEvent(final int id) = _$LoadProductByIdEventImpl;

  int get id;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadProductByIdEventImplCopyWith<_$LoadProductByIdEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}
