// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return _RegisterModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterModel {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  AccountType get accountType => throw _privateConstructorUsedError;
  String get jop => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterModelCopyWith<RegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterModelCopyWith<$Res> {
  factory $RegisterModelCopyWith(
          RegisterModel value, $Res Function(RegisterModel) then) =
      _$RegisterModelCopyWithImpl<$Res>;
  $Res call({String name, String phone, AccountType accountType, String jop});

  $AccountTypeCopyWith<$Res> get accountType;
}

/// @nodoc
class _$RegisterModelCopyWithImpl<$Res>
    implements $RegisterModelCopyWith<$Res> {
  _$RegisterModelCopyWithImpl(this._value, this._then);

  final RegisterModel _value;
  // ignore: unused_field
  final $Res Function(RegisterModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? accountType = freezed,
    Object? jop = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: accountType == freezed
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType,
      jop: jop == freezed
          ? _value.jop
          : jop // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $AccountTypeCopyWith<$Res> get accountType {
    return $AccountTypeCopyWith<$Res>(_value.accountType, (value) {
      return _then(_value.copyWith(accountType: value));
    });
  }
}

/// @nodoc
abstract class _$$_RegisterModelCopyWith<$Res>
    implements $RegisterModelCopyWith<$Res> {
  factory _$$_RegisterModelCopyWith(
          _$_RegisterModel value, $Res Function(_$_RegisterModel) then) =
      __$$_RegisterModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, String phone, AccountType accountType, String jop});

  @override
  $AccountTypeCopyWith<$Res> get accountType;
}

/// @nodoc
class __$$_RegisterModelCopyWithImpl<$Res>
    extends _$RegisterModelCopyWithImpl<$Res>
    implements _$$_RegisterModelCopyWith<$Res> {
  __$$_RegisterModelCopyWithImpl(
      _$_RegisterModel _value, $Res Function(_$_RegisterModel) _then)
      : super(_value, (v) => _then(v as _$_RegisterModel));

  @override
  _$_RegisterModel get _value => super._value as _$_RegisterModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? accountType = freezed,
    Object? jop = freezed,
  }) {
    return _then(_$_RegisterModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: accountType == freezed
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType,
      jop: jop == freezed
          ? _value.jop
          : jop // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterModel implements _RegisterModel {
  const _$_RegisterModel(
      {required this.name,
      required this.phone,
      required this.accountType,
      required this.jop});

  factory _$_RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterModelFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  @override
  final AccountType accountType;
  @override
  final String jop;

  @override
  String toString() {
    return 'RegisterModel(name: $name, phone: $phone, accountType: $accountType, jop: $jop)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality()
                .equals(other.accountType, accountType) &&
            const DeepCollectionEquality().equals(other.jop, jop));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(accountType),
      const DeepCollectionEquality().hash(jop));

  @JsonKey(ignore: true)
  @override
  _$$_RegisterModelCopyWith<_$_RegisterModel> get copyWith =>
      __$$_RegisterModelCopyWithImpl<_$_RegisterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterModelToJson(this);
  }
}

abstract class _RegisterModel implements RegisterModel {
  const factory _RegisterModel(
      {required final String name,
      required final String phone,
      required final AccountType accountType,
      required final String jop}) = _$_RegisterModel;

  factory _RegisterModel.fromJson(Map<String, dynamic> json) =
      _$_RegisterModel.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get phone => throw _privateConstructorUsedError;
  @override
  AccountType get accountType => throw _privateConstructorUsedError;
  @override
  String get jop => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterModelCopyWith<_$_RegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountType _$AccountTypeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'client':
      return AccountTypeClient.fromJson(json);
    case 'worker':
      return AccountTypeWorker.fromJson(json);
    case 'shop':
      return AccountTypeShop.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AccountType',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AccountType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() client,
    required TResult Function() worker,
    required TResult Function() shop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? client,
    TResult Function()? worker,
    TResult Function()? shop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? client,
    TResult Function()? worker,
    TResult Function()? shop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountTypeClient value) client,
    required TResult Function(AccountTypeWorker value) worker,
    required TResult Function(AccountTypeShop value) shop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AccountTypeClient value)? client,
    TResult Function(AccountTypeWorker value)? worker,
    TResult Function(AccountTypeShop value)? shop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountTypeClient value)? client,
    TResult Function(AccountTypeWorker value)? worker,
    TResult Function(AccountTypeShop value)? shop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountTypeCopyWith<$Res> {
  factory $AccountTypeCopyWith(
          AccountType value, $Res Function(AccountType) then) =
      _$AccountTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$AccountTypeCopyWithImpl<$Res> implements $AccountTypeCopyWith<$Res> {
  _$AccountTypeCopyWithImpl(this._value, this._then);

  final AccountType _value;
  // ignore: unused_field
  final $Res Function(AccountType) _then;
}

/// @nodoc
abstract class _$$AccountTypeClientCopyWith<$Res> {
  factory _$$AccountTypeClientCopyWith(
          _$AccountTypeClient value, $Res Function(_$AccountTypeClient) then) =
      __$$AccountTypeClientCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountTypeClientCopyWithImpl<$Res>
    extends _$AccountTypeCopyWithImpl<$Res>
    implements _$$AccountTypeClientCopyWith<$Res> {
  __$$AccountTypeClientCopyWithImpl(
      _$AccountTypeClient _value, $Res Function(_$AccountTypeClient) _then)
      : super(_value, (v) => _then(v as _$AccountTypeClient));

  @override
  _$AccountTypeClient get _value => super._value as _$AccountTypeClient;
}

/// @nodoc
@JsonSerializable()
class _$AccountTypeClient implements AccountTypeClient {
  const _$AccountTypeClient({final String? $type}) : $type = $type ?? 'client';

  factory _$AccountTypeClient.fromJson(Map<String, dynamic> json) =>
      _$$AccountTypeClientFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AccountType.client()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountTypeClient);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() client,
    required TResult Function() worker,
    required TResult Function() shop,
  }) {
    return client();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? client,
    TResult Function()? worker,
    TResult Function()? shop,
  }) {
    return client?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? client,
    TResult Function()? worker,
    TResult Function()? shop,
    required TResult orElse(),
  }) {
    if (client != null) {
      return client();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountTypeClient value) client,
    required TResult Function(AccountTypeWorker value) worker,
    required TResult Function(AccountTypeShop value) shop,
  }) {
    return client(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AccountTypeClient value)? client,
    TResult Function(AccountTypeWorker value)? worker,
    TResult Function(AccountTypeShop value)? shop,
  }) {
    return client?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountTypeClient value)? client,
    TResult Function(AccountTypeWorker value)? worker,
    TResult Function(AccountTypeShop value)? shop,
    required TResult orElse(),
  }) {
    if (client != null) {
      return client(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountTypeClientToJson(this);
  }
}

abstract class AccountTypeClient implements AccountType {
  const factory AccountTypeClient() = _$AccountTypeClient;

  factory AccountTypeClient.fromJson(Map<String, dynamic> json) =
      _$AccountTypeClient.fromJson;
}

/// @nodoc
abstract class _$$AccountTypeWorkerCopyWith<$Res> {
  factory _$$AccountTypeWorkerCopyWith(
          _$AccountTypeWorker value, $Res Function(_$AccountTypeWorker) then) =
      __$$AccountTypeWorkerCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountTypeWorkerCopyWithImpl<$Res>
    extends _$AccountTypeCopyWithImpl<$Res>
    implements _$$AccountTypeWorkerCopyWith<$Res> {
  __$$AccountTypeWorkerCopyWithImpl(
      _$AccountTypeWorker _value, $Res Function(_$AccountTypeWorker) _then)
      : super(_value, (v) => _then(v as _$AccountTypeWorker));

  @override
  _$AccountTypeWorker get _value => super._value as _$AccountTypeWorker;
}

/// @nodoc
@JsonSerializable()
class _$AccountTypeWorker implements AccountTypeWorker {
  const _$AccountTypeWorker({final String? $type}) : $type = $type ?? 'worker';

  factory _$AccountTypeWorker.fromJson(Map<String, dynamic> json) =>
      _$$AccountTypeWorkerFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AccountType.worker()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountTypeWorker);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() client,
    required TResult Function() worker,
    required TResult Function() shop,
  }) {
    return worker();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? client,
    TResult Function()? worker,
    TResult Function()? shop,
  }) {
    return worker?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? client,
    TResult Function()? worker,
    TResult Function()? shop,
    required TResult orElse(),
  }) {
    if (worker != null) {
      return worker();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountTypeClient value) client,
    required TResult Function(AccountTypeWorker value) worker,
    required TResult Function(AccountTypeShop value) shop,
  }) {
    return worker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AccountTypeClient value)? client,
    TResult Function(AccountTypeWorker value)? worker,
    TResult Function(AccountTypeShop value)? shop,
  }) {
    return worker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountTypeClient value)? client,
    TResult Function(AccountTypeWorker value)? worker,
    TResult Function(AccountTypeShop value)? shop,
    required TResult orElse(),
  }) {
    if (worker != null) {
      return worker(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountTypeWorkerToJson(this);
  }
}

abstract class AccountTypeWorker implements AccountType {
  const factory AccountTypeWorker() = _$AccountTypeWorker;

  factory AccountTypeWorker.fromJson(Map<String, dynamic> json) =
      _$AccountTypeWorker.fromJson;
}

/// @nodoc
abstract class _$$AccountTypeShopCopyWith<$Res> {
  factory _$$AccountTypeShopCopyWith(
          _$AccountTypeShop value, $Res Function(_$AccountTypeShop) then) =
      __$$AccountTypeShopCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountTypeShopCopyWithImpl<$Res>
    extends _$AccountTypeCopyWithImpl<$Res>
    implements _$$AccountTypeShopCopyWith<$Res> {
  __$$AccountTypeShopCopyWithImpl(
      _$AccountTypeShop _value, $Res Function(_$AccountTypeShop) _then)
      : super(_value, (v) => _then(v as _$AccountTypeShop));

  @override
  _$AccountTypeShop get _value => super._value as _$AccountTypeShop;
}

/// @nodoc
@JsonSerializable()
class _$AccountTypeShop implements AccountTypeShop {
  const _$AccountTypeShop({final String? $type}) : $type = $type ?? 'shop';

  factory _$AccountTypeShop.fromJson(Map<String, dynamic> json) =>
      _$$AccountTypeShopFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AccountType.shop()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountTypeShop);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() client,
    required TResult Function() worker,
    required TResult Function() shop,
  }) {
    return shop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? client,
    TResult Function()? worker,
    TResult Function()? shop,
  }) {
    return shop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? client,
    TResult Function()? worker,
    TResult Function()? shop,
    required TResult orElse(),
  }) {
    if (shop != null) {
      return shop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountTypeClient value) client,
    required TResult Function(AccountTypeWorker value) worker,
    required TResult Function(AccountTypeShop value) shop,
  }) {
    return shop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AccountTypeClient value)? client,
    TResult Function(AccountTypeWorker value)? worker,
    TResult Function(AccountTypeShop value)? shop,
  }) {
    return shop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountTypeClient value)? client,
    TResult Function(AccountTypeWorker value)? worker,
    TResult Function(AccountTypeShop value)? shop,
    required TResult orElse(),
  }) {
    if (shop != null) {
      return shop(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountTypeShopToJson(this);
  }
}

abstract class AccountTypeShop implements AccountType {
  const factory AccountTypeShop() = _$AccountTypeShop;

  factory AccountTypeShop.fromJson(Map<String, dynamic> json) =
      _$AccountTypeShop.fromJson;
}
