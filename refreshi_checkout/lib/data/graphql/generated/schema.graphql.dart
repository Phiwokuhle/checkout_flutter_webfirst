class Input$CreateOrderInput {
  factory Input$CreateOrderInput({
    required String requestId,
    required List<String> serviceIds,
    required String scheduledAt,
    required int totalCents,
    required String cardToken,
  }) =>
      Input$CreateOrderInput._({
        r'requestId': requestId,
        r'serviceIds': serviceIds,
        r'scheduledAt': scheduledAt,
        r'totalCents': totalCents,
        r'cardToken': cardToken,
      });

  Input$CreateOrderInput._(this._$data);

  factory Input$CreateOrderInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$requestId = data['requestId'];
    result$data['requestId'] = (l$requestId as String);
    final l$serviceIds = data['serviceIds'];
    result$data['serviceIds'] =
        (l$serviceIds as List<dynamic>).map((e) => (e as String)).toList();
    final l$scheduledAt = data['scheduledAt'];
    result$data['scheduledAt'] = (l$scheduledAt as String);
    final l$totalCents = data['totalCents'];
    result$data['totalCents'] = (l$totalCents as int);
    final l$cardToken = data['cardToken'];
    result$data['cardToken'] = (l$cardToken as String);
    return Input$CreateOrderInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get requestId => (_$data['requestId'] as String);

  List<String> get serviceIds => (_$data['serviceIds'] as List<String>);

  String get scheduledAt => (_$data['scheduledAt'] as String);

  int get totalCents => (_$data['totalCents'] as int);

  String get cardToken => (_$data['cardToken'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$requestId = requestId;
    result$data['requestId'] = l$requestId;
    final l$serviceIds = serviceIds;
    result$data['serviceIds'] = l$serviceIds.map((e) => e).toList();
    final l$scheduledAt = scheduledAt;
    result$data['scheduledAt'] = l$scheduledAt;
    final l$totalCents = totalCents;
    result$data['totalCents'] = l$totalCents;
    final l$cardToken = cardToken;
    result$data['cardToken'] = l$cardToken;
    return result$data;
  }

  CopyWith$Input$CreateOrderInput<Input$CreateOrderInput> get copyWith =>
      CopyWith$Input$CreateOrderInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateOrderInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$requestId = requestId;
    final lOther$requestId = other.requestId;
    if (l$requestId != lOther$requestId) {
      return false;
    }
    final l$serviceIds = serviceIds;
    final lOther$serviceIds = other.serviceIds;
    if (l$serviceIds.length != lOther$serviceIds.length) {
      return false;
    }
    for (int i = 0; i < l$serviceIds.length; i++) {
      final l$serviceIds$entry = l$serviceIds[i];
      final lOther$serviceIds$entry = lOther$serviceIds[i];
      if (l$serviceIds$entry != lOther$serviceIds$entry) {
        return false;
      }
    }
    final l$scheduledAt = scheduledAt;
    final lOther$scheduledAt = other.scheduledAt;
    if (l$scheduledAt != lOther$scheduledAt) {
      return false;
    }
    final l$totalCents = totalCents;
    final lOther$totalCents = other.totalCents;
    if (l$totalCents != lOther$totalCents) {
      return false;
    }
    final l$cardToken = cardToken;
    final lOther$cardToken = other.cardToken;
    if (l$cardToken != lOther$cardToken) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$requestId = requestId;
    final l$serviceIds = serviceIds;
    final l$scheduledAt = scheduledAt;
    final l$totalCents = totalCents;
    final l$cardToken = cardToken;
    return Object.hashAll([
      l$requestId,
      Object.hashAll(l$serviceIds.map((v) => v)),
      l$scheduledAt,
      l$totalCents,
      l$cardToken,
    ]);
  }
}

abstract class CopyWith$Input$CreateOrderInput<TRes> {
  factory CopyWith$Input$CreateOrderInput(
    Input$CreateOrderInput instance,
    TRes Function(Input$CreateOrderInput) then,
  ) = _CopyWithImpl$Input$CreateOrderInput;

  factory CopyWith$Input$CreateOrderInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateOrderInput;

  TRes call({
    String? requestId,
    List<String>? serviceIds,
    String? scheduledAt,
    int? totalCents,
    String? cardToken,
  });
}

class _CopyWithImpl$Input$CreateOrderInput<TRes>
    implements CopyWith$Input$CreateOrderInput<TRes> {
  _CopyWithImpl$Input$CreateOrderInput(
    this._instance,
    this._then,
  );

  final Input$CreateOrderInput _instance;

  final TRes Function(Input$CreateOrderInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? requestId = _undefined,
    Object? serviceIds = _undefined,
    Object? scheduledAt = _undefined,
    Object? totalCents = _undefined,
    Object? cardToken = _undefined,
  }) =>
      _then(Input$CreateOrderInput._({
        ..._instance._$data,
        if (requestId != _undefined && requestId != null)
          'requestId': (requestId as String),
        if (serviceIds != _undefined && serviceIds != null)
          'serviceIds': (serviceIds as List<String>),
        if (scheduledAt != _undefined && scheduledAt != null)
          'scheduledAt': (scheduledAt as String),
        if (totalCents != _undefined && totalCents != null)
          'totalCents': (totalCents as int),
        if (cardToken != _undefined && cardToken != null)
          'cardToken': (cardToken as String),
      }));
}

class _CopyWithStubImpl$Input$CreateOrderInput<TRes>
    implements CopyWith$Input$CreateOrderInput<TRes> {
  _CopyWithStubImpl$Input$CreateOrderInput(this._res);

  TRes _res;

  call({
    String? requestId,
    List<String>? serviceIds,
    String? scheduledAt,
    int? totalCents,
    String? cardToken,
  }) =>
      _res;
}

enum Enum$HoldStatus {
  PENDING,
  PLACED,
  $unknown;

  factory Enum$HoldStatus.fromJson(String value) =>
      fromJson$Enum$HoldStatus(value);

  String toJson() => toJson$Enum$HoldStatus(this);
}

String toJson$Enum$HoldStatus(Enum$HoldStatus e) {
  switch (e) {
    case Enum$HoldStatus.PENDING:
      return r'PENDING';
    case Enum$HoldStatus.PLACED:
      return r'PLACED';
    case Enum$HoldStatus.$unknown:
      return r'$unknown';
  }
}

Enum$HoldStatus fromJson$Enum$HoldStatus(String value) {
  switch (value) {
    case r'PENDING':
      return Enum$HoldStatus.PENDING;
    case r'PLACED':
      return Enum$HoldStatus.PLACED;
    default:
      return Enum$HoldStatus.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
