// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OrderState {
  OrderStatus get status => throw _privateConstructorUsedError;
  CheckoutOrder? get order => throw _privateConstructorUsedError;
  bool get holdPlaced => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderStateCopyWith<OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
    OrderState value,
    $Res Function(OrderState) then,
  ) = _$OrderStateCopyWithImpl<$Res, OrderState>;
  @useResult
  $Res call({
    OrderStatus status,
    CheckoutOrder? order,
    bool holdPlaced,
    String? error,
  });
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? order = freezed,
    Object? holdPlaced = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as OrderStatus,
            order: freezed == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                      as CheckoutOrder?,
            holdPlaced: null == holdPlaced
                ? _value.holdPlaced
                : holdPlaced // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderStateImplCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory _$$OrderStateImplCopyWith(
    _$OrderStateImpl value,
    $Res Function(_$OrderStateImpl) then,
  ) = __$$OrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    OrderStatus status,
    CheckoutOrder? order,
    bool holdPlaced,
    String? error,
  });
}

/// @nodoc
class __$$OrderStateImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateImpl>
    implements _$$OrderStateImplCopyWith<$Res> {
  __$$OrderStateImplCopyWithImpl(
    _$OrderStateImpl _value,
    $Res Function(_$OrderStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? order = freezed,
    Object? holdPlaced = null,
    Object? error = freezed,
  }) {
    return _then(
      _$OrderStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as OrderStatus,
        order: freezed == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as CheckoutOrder?,
        holdPlaced: null == holdPlaced
            ? _value.holdPlaced
            : holdPlaced // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OrderStateImpl implements _OrderState {
  const _$OrderStateImpl({
    this.status = OrderStatus.initial,
    this.order,
    this.holdPlaced = false,
    this.error,
  });

  @override
  @JsonKey()
  final OrderStatus status;
  @override
  final CheckoutOrder? order;
  @override
  @JsonKey()
  final bool holdPlaced;
  @override
  final String? error;

  @override
  String toString() {
    return 'OrderState(status: $status, order: $order, holdPlaced: $holdPlaced, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.holdPlaced, holdPlaced) ||
                other.holdPlaced == holdPlaced) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, order, holdPlaced, error);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      __$$OrderStateImplCopyWithImpl<_$OrderStateImpl>(this, _$identity);
}

abstract class _OrderState implements OrderState {
  const factory _OrderState({
    final OrderStatus status,
    final CheckoutOrder? order,
    final bool holdPlaced,
    final String? error,
  }) = _$OrderStateImpl;

  @override
  OrderStatus get status;
  @override
  CheckoutOrder? get order;
  @override
  bool get holdPlaced;
  @override
  String? get error;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
