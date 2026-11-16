// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CheckoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String serviceId) serviceToggled,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(int hour, int minute) timeChanged,
    required TResult Function() submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String serviceId)? serviceToggled,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(int hour, int minute)? timeChanged,
    TResult? Function()? submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String serviceId)? serviceToggled,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int hour, int minute)? timeChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutStarted value) started,
    required TResult Function(CheckoutServiceToggled value) serviceToggled,
    required TResult Function(CheckoutDateChanged value) dateChanged,
    required TResult Function(CheckoutTimeChanged value) timeChanged,
    required TResult Function(CheckoutSubmitted value) submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutStarted value)? started,
    TResult? Function(CheckoutServiceToggled value)? serviceToggled,
    TResult? Function(CheckoutDateChanged value)? dateChanged,
    TResult? Function(CheckoutTimeChanged value)? timeChanged,
    TResult? Function(CheckoutSubmitted value)? submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutStarted value)? started,
    TResult Function(CheckoutServiceToggled value)? serviceToggled,
    TResult Function(CheckoutDateChanged value)? dateChanged,
    TResult Function(CheckoutTimeChanged value)? timeChanged,
    TResult Function(CheckoutSubmitted value)? submitted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutEventCopyWith<$Res> {
  factory $CheckoutEventCopyWith(
    CheckoutEvent value,
    $Res Function(CheckoutEvent) then,
  ) = _$CheckoutEventCopyWithImpl<$Res, CheckoutEvent>;
}

/// @nodoc
class _$CheckoutEventCopyWithImpl<$Res, $Val extends CheckoutEvent>
    implements $CheckoutEventCopyWith<$Res> {
  _$CheckoutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckoutStartedImplCopyWith<$Res> {
  factory _$$CheckoutStartedImplCopyWith(
    _$CheckoutStartedImpl value,
    $Res Function(_$CheckoutStartedImpl) then,
  ) = __$$CheckoutStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckoutStartedImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$CheckoutStartedImpl>
    implements _$$CheckoutStartedImplCopyWith<$Res> {
  __$$CheckoutStartedImplCopyWithImpl(
    _$CheckoutStartedImpl _value,
    $Res Function(_$CheckoutStartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckoutStartedImpl implements CheckoutStarted {
  const _$CheckoutStartedImpl();

  @override
  String toString() {
    return 'CheckoutEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckoutStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String serviceId) serviceToggled,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(int hour, int minute) timeChanged,
    required TResult Function() submitted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String serviceId)? serviceToggled,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(int hour, int minute)? timeChanged,
    TResult? Function()? submitted,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String serviceId)? serviceToggled,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int hour, int minute)? timeChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutStarted value) started,
    required TResult Function(CheckoutServiceToggled value) serviceToggled,
    required TResult Function(CheckoutDateChanged value) dateChanged,
    required TResult Function(CheckoutTimeChanged value) timeChanged,
    required TResult Function(CheckoutSubmitted value) submitted,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutStarted value)? started,
    TResult? Function(CheckoutServiceToggled value)? serviceToggled,
    TResult? Function(CheckoutDateChanged value)? dateChanged,
    TResult? Function(CheckoutTimeChanged value)? timeChanged,
    TResult? Function(CheckoutSubmitted value)? submitted,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutStarted value)? started,
    TResult Function(CheckoutServiceToggled value)? serviceToggled,
    TResult Function(CheckoutDateChanged value)? dateChanged,
    TResult Function(CheckoutTimeChanged value)? timeChanged,
    TResult Function(CheckoutSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class CheckoutStarted implements CheckoutEvent {
  const factory CheckoutStarted() = _$CheckoutStartedImpl;
}

/// @nodoc
abstract class _$$CheckoutServiceToggledImplCopyWith<$Res> {
  factory _$$CheckoutServiceToggledImplCopyWith(
    _$CheckoutServiceToggledImpl value,
    $Res Function(_$CheckoutServiceToggledImpl) then,
  ) = __$$CheckoutServiceToggledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serviceId});
}

/// @nodoc
class __$$CheckoutServiceToggledImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$CheckoutServiceToggledImpl>
    implements _$$CheckoutServiceToggledImplCopyWith<$Res> {
  __$$CheckoutServiceToggledImplCopyWithImpl(
    _$CheckoutServiceToggledImpl _value,
    $Res Function(_$CheckoutServiceToggledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? serviceId = null}) {
    return _then(
      _$CheckoutServiceToggledImpl(
        null == serviceId
            ? _value.serviceId
            : serviceId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CheckoutServiceToggledImpl implements CheckoutServiceToggled {
  const _$CheckoutServiceToggledImpl(this.serviceId);

  @override
  final String serviceId;

  @override
  String toString() {
    return 'CheckoutEvent.serviceToggled(serviceId: $serviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutServiceToggledImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceId);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutServiceToggledImplCopyWith<_$CheckoutServiceToggledImpl>
  get copyWith =>
      __$$CheckoutServiceToggledImplCopyWithImpl<_$CheckoutServiceToggledImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String serviceId) serviceToggled,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(int hour, int minute) timeChanged,
    required TResult Function() submitted,
  }) {
    return serviceToggled(serviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String serviceId)? serviceToggled,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(int hour, int minute)? timeChanged,
    TResult? Function()? submitted,
  }) {
    return serviceToggled?.call(serviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String serviceId)? serviceToggled,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int hour, int minute)? timeChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (serviceToggled != null) {
      return serviceToggled(serviceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutStarted value) started,
    required TResult Function(CheckoutServiceToggled value) serviceToggled,
    required TResult Function(CheckoutDateChanged value) dateChanged,
    required TResult Function(CheckoutTimeChanged value) timeChanged,
    required TResult Function(CheckoutSubmitted value) submitted,
  }) {
    return serviceToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutStarted value)? started,
    TResult? Function(CheckoutServiceToggled value)? serviceToggled,
    TResult? Function(CheckoutDateChanged value)? dateChanged,
    TResult? Function(CheckoutTimeChanged value)? timeChanged,
    TResult? Function(CheckoutSubmitted value)? submitted,
  }) {
    return serviceToggled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutStarted value)? started,
    TResult Function(CheckoutServiceToggled value)? serviceToggled,
    TResult Function(CheckoutDateChanged value)? dateChanged,
    TResult Function(CheckoutTimeChanged value)? timeChanged,
    TResult Function(CheckoutSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (serviceToggled != null) {
      return serviceToggled(this);
    }
    return orElse();
  }
}

abstract class CheckoutServiceToggled implements CheckoutEvent {
  const factory CheckoutServiceToggled(final String serviceId) =
      _$CheckoutServiceToggledImpl;

  String get serviceId;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutServiceToggledImplCopyWith<_$CheckoutServiceToggledImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutDateChangedImplCopyWith<$Res> {
  factory _$$CheckoutDateChangedImplCopyWith(
    _$CheckoutDateChangedImpl value,
    $Res Function(_$CheckoutDateChangedImpl) then,
  ) = __$$CheckoutDateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$CheckoutDateChangedImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$CheckoutDateChangedImpl>
    implements _$$CheckoutDateChangedImplCopyWith<$Res> {
  __$$CheckoutDateChangedImplCopyWithImpl(
    _$CheckoutDateChangedImpl _value,
    $Res Function(_$CheckoutDateChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? date = null}) {
    return _then(
      _$CheckoutDateChangedImpl(
        null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$CheckoutDateChangedImpl implements CheckoutDateChanged {
  const _$CheckoutDateChangedImpl(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'CheckoutEvent.dateChanged(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutDateChangedImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutDateChangedImplCopyWith<_$CheckoutDateChangedImpl> get copyWith =>
      __$$CheckoutDateChangedImplCopyWithImpl<_$CheckoutDateChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String serviceId) serviceToggled,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(int hour, int minute) timeChanged,
    required TResult Function() submitted,
  }) {
    return dateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String serviceId)? serviceToggled,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(int hour, int minute)? timeChanged,
    TResult? Function()? submitted,
  }) {
    return dateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String serviceId)? serviceToggled,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int hour, int minute)? timeChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutStarted value) started,
    required TResult Function(CheckoutServiceToggled value) serviceToggled,
    required TResult Function(CheckoutDateChanged value) dateChanged,
    required TResult Function(CheckoutTimeChanged value) timeChanged,
    required TResult Function(CheckoutSubmitted value) submitted,
  }) {
    return dateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutStarted value)? started,
    TResult? Function(CheckoutServiceToggled value)? serviceToggled,
    TResult? Function(CheckoutDateChanged value)? dateChanged,
    TResult? Function(CheckoutTimeChanged value)? timeChanged,
    TResult? Function(CheckoutSubmitted value)? submitted,
  }) {
    return dateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutStarted value)? started,
    TResult Function(CheckoutServiceToggled value)? serviceToggled,
    TResult Function(CheckoutDateChanged value)? dateChanged,
    TResult Function(CheckoutTimeChanged value)? timeChanged,
    TResult Function(CheckoutSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(this);
    }
    return orElse();
  }
}

abstract class CheckoutDateChanged implements CheckoutEvent {
  const factory CheckoutDateChanged(final DateTime date) =
      _$CheckoutDateChangedImpl;

  DateTime get date;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutDateChangedImplCopyWith<_$CheckoutDateChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutTimeChangedImplCopyWith<$Res> {
  factory _$$CheckoutTimeChangedImplCopyWith(
    _$CheckoutTimeChangedImpl value,
    $Res Function(_$CheckoutTimeChangedImpl) then,
  ) = __$$CheckoutTimeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class __$$CheckoutTimeChangedImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$CheckoutTimeChangedImpl>
    implements _$$CheckoutTimeChangedImplCopyWith<$Res> {
  __$$CheckoutTimeChangedImplCopyWithImpl(
    _$CheckoutTimeChangedImpl _value,
    $Res Function(_$CheckoutTimeChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hour = null, Object? minute = null}) {
    return _then(
      _$CheckoutTimeChangedImpl(
        null == hour
            ? _value.hour
            : hour // ignore: cast_nullable_to_non_nullable
                  as int,
        null == minute
            ? _value.minute
            : minute // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$CheckoutTimeChangedImpl implements CheckoutTimeChanged {
  const _$CheckoutTimeChangedImpl(this.hour, this.minute);

  @override
  final int hour;
  @override
  final int minute;

  @override
  String toString() {
    return 'CheckoutEvent.timeChanged(hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutTimeChangedImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hour, minute);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutTimeChangedImplCopyWith<_$CheckoutTimeChangedImpl> get copyWith =>
      __$$CheckoutTimeChangedImplCopyWithImpl<_$CheckoutTimeChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String serviceId) serviceToggled,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(int hour, int minute) timeChanged,
    required TResult Function() submitted,
  }) {
    return timeChanged(hour, minute);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String serviceId)? serviceToggled,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(int hour, int minute)? timeChanged,
    TResult? Function()? submitted,
  }) {
    return timeChanged?.call(hour, minute);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String serviceId)? serviceToggled,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int hour, int minute)? timeChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (timeChanged != null) {
      return timeChanged(hour, minute);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutStarted value) started,
    required TResult Function(CheckoutServiceToggled value) serviceToggled,
    required TResult Function(CheckoutDateChanged value) dateChanged,
    required TResult Function(CheckoutTimeChanged value) timeChanged,
    required TResult Function(CheckoutSubmitted value) submitted,
  }) {
    return timeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutStarted value)? started,
    TResult? Function(CheckoutServiceToggled value)? serviceToggled,
    TResult? Function(CheckoutDateChanged value)? dateChanged,
    TResult? Function(CheckoutTimeChanged value)? timeChanged,
    TResult? Function(CheckoutSubmitted value)? submitted,
  }) {
    return timeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutStarted value)? started,
    TResult Function(CheckoutServiceToggled value)? serviceToggled,
    TResult Function(CheckoutDateChanged value)? dateChanged,
    TResult Function(CheckoutTimeChanged value)? timeChanged,
    TResult Function(CheckoutSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (timeChanged != null) {
      return timeChanged(this);
    }
    return orElse();
  }
}

abstract class CheckoutTimeChanged implements CheckoutEvent {
  const factory CheckoutTimeChanged(final int hour, final int minute) =
      _$CheckoutTimeChangedImpl;

  int get hour;
  int get minute;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutTimeChangedImplCopyWith<_$CheckoutTimeChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutSubmittedImplCopyWith<$Res> {
  factory _$$CheckoutSubmittedImplCopyWith(
    _$CheckoutSubmittedImpl value,
    $Res Function(_$CheckoutSubmittedImpl) then,
  ) = __$$CheckoutSubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckoutSubmittedImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$CheckoutSubmittedImpl>
    implements _$$CheckoutSubmittedImplCopyWith<$Res> {
  __$$CheckoutSubmittedImplCopyWithImpl(
    _$CheckoutSubmittedImpl _value,
    $Res Function(_$CheckoutSubmittedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckoutSubmittedImpl implements CheckoutSubmitted {
  const _$CheckoutSubmittedImpl();

  @override
  String toString() {
    return 'CheckoutEvent.submitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckoutSubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String serviceId) serviceToggled,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(int hour, int minute) timeChanged,
    required TResult Function() submitted,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String serviceId)? serviceToggled,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(int hour, int minute)? timeChanged,
    TResult? Function()? submitted,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String serviceId)? serviceToggled,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int hour, int minute)? timeChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutStarted value) started,
    required TResult Function(CheckoutServiceToggled value) serviceToggled,
    required TResult Function(CheckoutDateChanged value) dateChanged,
    required TResult Function(CheckoutTimeChanged value) timeChanged,
    required TResult Function(CheckoutSubmitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutStarted value)? started,
    TResult? Function(CheckoutServiceToggled value)? serviceToggled,
    TResult? Function(CheckoutDateChanged value)? dateChanged,
    TResult? Function(CheckoutTimeChanged value)? timeChanged,
    TResult? Function(CheckoutSubmitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutStarted value)? started,
    TResult Function(CheckoutServiceToggled value)? serviceToggled,
    TResult Function(CheckoutDateChanged value)? dateChanged,
    TResult Function(CheckoutTimeChanged value)? timeChanged,
    TResult Function(CheckoutSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class CheckoutSubmitted implements CheckoutEvent {
  const factory CheckoutSubmitted() = _$CheckoutSubmittedImpl;
}
