// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OrderEvent {
  String get orderId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderId) loadRequested,
    required TResult Function(String orderId) refreshRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderId)? loadRequested,
    TResult? Function(String orderId)? refreshRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderId)? loadRequested,
    TResult Function(String orderId)? refreshRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderLoadRequested value) loadRequested,
    required TResult Function(OrderRefreshRequested value) refreshRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderLoadRequested value)? loadRequested,
    TResult? Function(OrderRefreshRequested value)? refreshRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderLoadRequested value)? loadRequested,
    TResult Function(OrderRefreshRequested value)? refreshRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderEventCopyWith<OrderEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEventCopyWith<$Res> {
  factory $OrderEventCopyWith(
    OrderEvent value,
    $Res Function(OrderEvent) then,
  ) = _$OrderEventCopyWithImpl<$Res, OrderEvent>;
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class _$OrderEventCopyWithImpl<$Res, $Val extends OrderEvent>
    implements $OrderEventCopyWith<$Res> {
  _$OrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _value.copyWith(
            orderId: null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderLoadRequestedImplCopyWith<$Res>
    implements $OrderEventCopyWith<$Res> {
  factory _$$OrderLoadRequestedImplCopyWith(
    _$OrderLoadRequestedImpl value,
    $Res Function(_$OrderLoadRequestedImpl) then,
  ) = __$$OrderLoadRequestedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class __$$OrderLoadRequestedImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$OrderLoadRequestedImpl>
    implements _$$OrderLoadRequestedImplCopyWith<$Res> {
  __$$OrderLoadRequestedImplCopyWithImpl(
    _$OrderLoadRequestedImpl _value,
    $Res Function(_$OrderLoadRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _$OrderLoadRequestedImpl(
        null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$OrderLoadRequestedImpl implements OrderLoadRequested {
  const _$OrderLoadRequestedImpl(this.orderId);

  @override
  final String orderId;

  @override
  String toString() {
    return 'OrderEvent.loadRequested(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderLoadRequestedImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLoadRequestedImplCopyWith<_$OrderLoadRequestedImpl> get copyWith =>
      __$$OrderLoadRequestedImplCopyWithImpl<_$OrderLoadRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderId) loadRequested,
    required TResult Function(String orderId) refreshRequested,
  }) {
    return loadRequested(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderId)? loadRequested,
    TResult? Function(String orderId)? refreshRequested,
  }) {
    return loadRequested?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderId)? loadRequested,
    TResult Function(String orderId)? refreshRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderLoadRequested value) loadRequested,
    required TResult Function(OrderRefreshRequested value) refreshRequested,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderLoadRequested value)? loadRequested,
    TResult? Function(OrderRefreshRequested value)? refreshRequested,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderLoadRequested value)? loadRequested,
    TResult Function(OrderRefreshRequested value)? refreshRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class OrderLoadRequested implements OrderEvent {
  const factory OrderLoadRequested(final String orderId) =
      _$OrderLoadRequestedImpl;

  @override
  String get orderId;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderLoadRequestedImplCopyWith<_$OrderLoadRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderRefreshRequestedImplCopyWith<$Res>
    implements $OrderEventCopyWith<$Res> {
  factory _$$OrderRefreshRequestedImplCopyWith(
    _$OrderRefreshRequestedImpl value,
    $Res Function(_$OrderRefreshRequestedImpl) then,
  ) = __$$OrderRefreshRequestedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class __$$OrderRefreshRequestedImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$OrderRefreshRequestedImpl>
    implements _$$OrderRefreshRequestedImplCopyWith<$Res> {
  __$$OrderRefreshRequestedImplCopyWithImpl(
    _$OrderRefreshRequestedImpl _value,
    $Res Function(_$OrderRefreshRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _$OrderRefreshRequestedImpl(
        null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$OrderRefreshRequestedImpl implements OrderRefreshRequested {
  const _$OrderRefreshRequestedImpl(this.orderId);

  @override
  final String orderId;

  @override
  String toString() {
    return 'OrderEvent.refreshRequested(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderRefreshRequestedImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderRefreshRequestedImplCopyWith<_$OrderRefreshRequestedImpl>
  get copyWith =>
      __$$OrderRefreshRequestedImplCopyWithImpl<_$OrderRefreshRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderId) loadRequested,
    required TResult Function(String orderId) refreshRequested,
  }) {
    return refreshRequested(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderId)? loadRequested,
    TResult? Function(String orderId)? refreshRequested,
  }) {
    return refreshRequested?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderId)? loadRequested,
    TResult Function(String orderId)? refreshRequested,
    required TResult orElse(),
  }) {
    if (refreshRequested != null) {
      return refreshRequested(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderLoadRequested value) loadRequested,
    required TResult Function(OrderRefreshRequested value) refreshRequested,
  }) {
    return refreshRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderLoadRequested value)? loadRequested,
    TResult? Function(OrderRefreshRequested value)? refreshRequested,
  }) {
    return refreshRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderLoadRequested value)? loadRequested,
    TResult Function(OrderRefreshRequested value)? refreshRequested,
    required TResult orElse(),
  }) {
    if (refreshRequested != null) {
      return refreshRequested(this);
    }
    return orElse();
  }
}

abstract class OrderRefreshRequested implements OrderEvent {
  const factory OrderRefreshRequested(final String orderId) =
      _$OrderRefreshRequestedImpl;

  @override
  String get orderId;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderRefreshRequestedImplCopyWith<_$OrderRefreshRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}
