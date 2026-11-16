// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CheckoutState {
  CheckoutStatus get status => throw _privateConstructorUsedError;
  List<ServiceModel> get services => throw _privateConstructorUsedError;
  List<String> get selectedIds => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  int? get hour => throw _privateConstructorUsedError;
  int? get minute => throw _privateConstructorUsedError;
  int get totalCents => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
    CheckoutState value,
    $Res Function(CheckoutState) then,
  ) = _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
  @useResult
  $Res call({
    CheckoutStatus status,
    List<ServiceModel> services,
    List<String> selectedIds,
    DateTime? date,
    int? hour,
    int? minute,
    int totalCents,
    String? error,
    String? orderId,
  });
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? services = null,
    Object? selectedIds = null,
    Object? date = freezed,
    Object? hour = freezed,
    Object? minute = freezed,
    Object? totalCents = null,
    Object? error = freezed,
    Object? orderId = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as CheckoutStatus,
            services: null == services
                ? _value.services
                : services // ignore: cast_nullable_to_non_nullable
                      as List<ServiceModel>,
            selectedIds: null == selectedIds
                ? _value.selectedIds
                : selectedIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            hour: freezed == hour
                ? _value.hour
                : hour // ignore: cast_nullable_to_non_nullable
                      as int?,
            minute: freezed == minute
                ? _value.minute
                : minute // ignore: cast_nullable_to_non_nullable
                      as int?,
            totalCents: null == totalCents
                ? _value.totalCents
                : totalCents // ignore: cast_nullable_to_non_nullable
                      as int,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            orderId: freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckoutStateImplCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$CheckoutStateImplCopyWith(
    _$CheckoutStateImpl value,
    $Res Function(_$CheckoutStateImpl) then,
  ) = __$$CheckoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CheckoutStatus status,
    List<ServiceModel> services,
    List<String> selectedIds,
    DateTime? date,
    int? hour,
    int? minute,
    int totalCents,
    String? error,
    String? orderId,
  });
}

/// @nodoc
class __$$CheckoutStateImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutStateImpl>
    implements _$$CheckoutStateImplCopyWith<$Res> {
  __$$CheckoutStateImplCopyWithImpl(
    _$CheckoutStateImpl _value,
    $Res Function(_$CheckoutStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? services = null,
    Object? selectedIds = null,
    Object? date = freezed,
    Object? hour = freezed,
    Object? minute = freezed,
    Object? totalCents = null,
    Object? error = freezed,
    Object? orderId = freezed,
  }) {
    return _then(
      _$CheckoutStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CheckoutStatus,
        services: null == services
            ? _value._services
            : services // ignore: cast_nullable_to_non_nullable
                  as List<ServiceModel>,
        selectedIds: null == selectedIds
            ? _value._selectedIds
            : selectedIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        hour: freezed == hour
            ? _value.hour
            : hour // ignore: cast_nullable_to_non_nullable
                  as int?,
        minute: freezed == minute
            ? _value.minute
            : minute // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalCents: null == totalCents
            ? _value.totalCents
            : totalCents // ignore: cast_nullable_to_non_nullable
                  as int,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        orderId: freezed == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CheckoutStateImpl extends _CheckoutState {
  const _$CheckoutStateImpl({
    this.status = CheckoutStatus.initial,
    final List<ServiceModel> services = const <ServiceModel>[],
    final List<String> selectedIds = const <String>[],
    this.date,
    this.hour,
    this.minute,
    this.totalCents = 0,
    this.error,
    this.orderId,
  }) : _services = services,
       _selectedIds = selectedIds,
       super._();

  @override
  @JsonKey()
  final CheckoutStatus status;
  final List<ServiceModel> _services;
  @override
  @JsonKey()
  List<ServiceModel> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  final List<String> _selectedIds;
  @override
  @JsonKey()
  List<String> get selectedIds {
    if (_selectedIds is EqualUnmodifiableListView) return _selectedIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedIds);
  }

  @override
  final DateTime? date;
  @override
  final int? hour;
  @override
  final int? minute;
  @override
  @JsonKey()
  final int totalCents;
  @override
  final String? error;
  @override
  final String? orderId;

  @override
  String toString() {
    return 'CheckoutState(status: $status, services: $services, selectedIds: $selectedIds, date: $date, hour: $hour, minute: $minute, totalCents: $totalCents, error: $error, orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(
              other._selectedIds,
              _selectedIds,
            ) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.totalCents, totalCents) ||
                other.totalCents == totalCents) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_services),
    const DeepCollectionEquality().hash(_selectedIds),
    date,
    hour,
    minute,
    totalCents,
    error,
    orderId,
  );

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      __$$CheckoutStateImplCopyWithImpl<_$CheckoutStateImpl>(this, _$identity);
}

abstract class _CheckoutState extends CheckoutState {
  const factory _CheckoutState({
    final CheckoutStatus status,
    final List<ServiceModel> services,
    final List<String> selectedIds,
    final DateTime? date,
    final int? hour,
    final int? minute,
    final int totalCents,
    final String? error,
    final String? orderId,
  }) = _$CheckoutStateImpl;
  const _CheckoutState._() : super._();

  @override
  CheckoutStatus get status;
  @override
  List<ServiceModel> get services;
  @override
  List<String> get selectedIds;
  @override
  DateTime? get date;
  @override
  int? get hour;
  @override
  int? get minute;
  @override
  int get totalCents;
  @override
  String? get error;
  @override
  String? get orderId;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
