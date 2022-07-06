// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() codeSent,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? codeSent,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? codeSent,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitial value) initial,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateLoaded value) loaded,
    required TResult Function(_AuthStateCodeSent value) codeSent,
    required TResult Function(_AuthStatePhoneError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateLoaded value)? loaded,
    TResult Function(_AuthStateCodeSent value)? codeSent,
    TResult Function(_AuthStatePhoneError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateLoaded value)? loaded,
    TResult Function(_AuthStateCodeSent value)? codeSent,
    TResult Function(_AuthStatePhoneError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) = _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$$_AuthStateInitialCopyWith<$Res> {
  factory _$$_AuthStateInitialCopyWith(_$_AuthStateInitial value, $Res Function(_$_AuthStateInitial) then) = __$$_AuthStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateInitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res> implements _$$_AuthStateInitialCopyWith<$Res> {
  __$$_AuthStateInitialCopyWithImpl(_$_AuthStateInitial _value, $Res Function(_$_AuthStateInitial) _then)
      : super(_value, (v) => _then(v as _$_AuthStateInitial));

  @override
  _$_AuthStateInitial get _value => super._value as _$_AuthStateInitial;
}

/// @nodoc

class _$_AuthStateInitial implements _AuthStateInitial {
  const _$_AuthStateInitial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_AuthStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() codeSent,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? codeSent,
    TResult Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? codeSent,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitial value) initial,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateLoaded value) loaded,
    required TResult Function(_AuthStateCodeSent value) codeSent,
    required TResult Function(_AuthStatePhoneError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateLoaded value)? loaded,
    TResult Function(_AuthStateCodeSent value)? codeSent,
    TResult Function(_AuthStatePhoneError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateLoaded value)? loaded,
    TResult Function(_AuthStateCodeSent value)? codeSent,
    TResult Function(_AuthStatePhoneError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AuthStateInitial implements AuthState {
  const factory _AuthStateInitial() = _$_AuthStateInitial;
}

/// @nodoc
abstract class _$$_AuthStateLoadingCopyWith<$Res> {
  factory _$$_AuthStateLoadingCopyWith(_$_AuthStateLoading value, $Res Function(_$_AuthStateLoading) then) = __$$_AuthStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateLoadingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res> implements _$$_AuthStateLoadingCopyWith<$Res> {
  __$$_AuthStateLoadingCopyWithImpl(_$_AuthStateLoading _value, $Res Function(_$_AuthStateLoading) _then)
      : super(_value, (v) => _then(v as _$_AuthStateLoading));

  @override
  _$_AuthStateLoading get _value => super._value as _$_AuthStateLoading;
}

/// @nodoc

class _$_AuthStateLoading implements _AuthStateLoading {
  const _$_AuthStateLoading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_AuthStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() codeSent,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? codeSent,
    TResult Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? codeSent,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitial value) initial,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateLoaded value) loaded,
    required TResult Function(_AuthStateCodeSent value) codeSent,
    required TResult Function(_AuthStatePhoneError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateLoaded value)? loaded,
    TResult Function(_AuthStateCodeSent value)? codeSent,
    TResult Function(_AuthStatePhoneError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateLoaded value)? loaded,
    TResult Function(_AuthStateCodeSent value)? codeSent,
    TResult Function(_AuthStatePhoneError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AuthStateLoading implements AuthState {
  const factory _AuthStateLoading() = _$_AuthStateLoading;
}

/// @nodoc
abstract class _$$_AuthStateLoadedCopyWith<$Res> {
  factory _$$_AuthStateLoadedCopyWith(_$_AuthStateLoaded value, $Res Function(_$_AuthStateLoaded) then) = __$$_AuthStateLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateLoadedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res> implements _$$_AuthStateLoadedCopyWith<$Res> {
  __$$_AuthStateLoadedCopyWithImpl(_$_AuthStateLoaded _value, $Res Function(_$_AuthStateLoaded) _then)
      : super(_value, (v) => _then(v as _$_AuthStateLoaded));

  @override
  _$_AuthStateLoaded get _value => super._value as _$_AuthStateLoaded;
}

/// @nodoc

class _$_AuthStateLoaded implements _AuthStateLoaded {
  const _$_AuthStateLoaded();

  @override
  String toString() {
    return 'AuthState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_AuthStateLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() codeSent,
    required TResult Function(String error) error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? codeSent,
    TResult Function(String error)? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? codeSent,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitial value) initial,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateLoaded value) loaded,
    required TResult Function(_AuthStateCodeSent value) codeSent,
    required TResult Function(_AuthStatePhoneError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateLoaded value)? loaded,
    TResult Function(_AuthStateCodeSent value)? codeSent,
    TResult Function(_AuthStatePhoneError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateLoaded value)? loaded,
    TResult Function(_AuthStateCodeSent value)? codeSent,
    TResult Function(_AuthStatePhoneError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _AuthStateLoaded implements AuthState {
  const factory _AuthStateLoaded() = _$_AuthStateLoaded;
}

/// @nodoc
abstract class _$$_AuthStateCodeSentCopyWith<$Res> {
  factory _$$_AuthStateCodeSentCopyWith(_$_AuthStateCodeSent value, $Res Function(_$_AuthStateCodeSent) then) = __$$_AuthStateCodeSentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateCodeSentCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res> implements _$$_AuthStateCodeSentCopyWith<$Res> {
  __$$_AuthStateCodeSentCopyWithImpl(_$_AuthStateCodeSent _value, $Res Function(_$_AuthStateCodeSent) _then)
      : super(_value, (v) => _then(v as _$_AuthStateCodeSent));

  @override
  _$_AuthStateCodeSent get _value => super._value as _$_AuthStateCodeSent;
}

/// @nodoc

class _$_AuthStateCodeSent implements _AuthStateCodeSent {
  const _$_AuthStateCodeSent();

  @override
  String toString() {
    return 'AuthState.codeSent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_AuthStateCodeSent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() codeSent,
    required TResult Function(String error) error,
  }) {
    return codeSent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? codeSent,
    TResult Function(String error)? error,
  }) {
    return codeSent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? codeSent,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (codeSent != null) {
      return codeSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitial value) initial,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateLoaded value) loaded,
    required TResult Function(_AuthStateCodeSent value) codeSent,
    required TResult Function(_AuthStatePhoneError value) error,
  }) {
    return codeSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateLoaded value)? loaded,
    TResult Function(_AuthStateCodeSent value)? codeSent,
    TResult Function(_AuthStatePhoneError value)? error,
  }) {
    return codeSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateLoaded value)? loaded,
    TResult Function(_AuthStateCodeSent value)? codeSent,
    TResult Function(_AuthStatePhoneError value)? error,
    required TResult orElse(),
  }) {
    if (codeSent != null) {
      return codeSent(this);
    }
    return orElse();
  }
}

abstract class _AuthStateCodeSent implements AuthState {
  const factory _AuthStateCodeSent() = _$_AuthStateCodeSent;
}

/// @nodoc
abstract class _$$_AuthStatePhoneErrorCopyWith<$Res> {
  factory _$$_AuthStatePhoneErrorCopyWith(_$_AuthStatePhoneError value, $Res Function(_$_AuthStatePhoneError) then) =
      __$$_AuthStatePhoneErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$_AuthStatePhoneErrorCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res> implements _$$_AuthStatePhoneErrorCopyWith<$Res> {
  __$$_AuthStatePhoneErrorCopyWithImpl(_$_AuthStatePhoneError _value, $Res Function(_$_AuthStatePhoneError) _then)
      : super(_value, (v) => _then(v as _$_AuthStatePhoneError));

  @override
  _$_AuthStatePhoneError get _value => super._value as _$_AuthStatePhoneError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_AuthStatePhoneError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthStatePhoneError implements _AuthStatePhoneError {
  const _$_AuthStatePhoneError(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'AuthState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthStatePhoneError && const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_AuthStatePhoneErrorCopyWith<_$_AuthStatePhoneError> get copyWith => __$$_AuthStatePhoneErrorCopyWithImpl<_$_AuthStatePhoneError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() codeSent,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? codeSent,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? codeSent,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitial value) initial,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateLoaded value) loaded,
    required TResult Function(_AuthStateCodeSent value) codeSent,
    required TResult Function(_AuthStatePhoneError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateLoaded value)? loaded,
    TResult Function(_AuthStateCodeSent value)? codeSent,
    TResult Function(_AuthStatePhoneError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateLoaded value)? loaded,
    TResult Function(_AuthStateCodeSent value)? codeSent,
    TResult Function(_AuthStatePhoneError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AuthStatePhoneError implements AuthState {
  const factory _AuthStatePhoneError(final String error) = _$_AuthStatePhoneError;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_AuthStatePhoneErrorCopyWith<_$_AuthStatePhoneError> get copyWith => throw _privateConstructorUsedError;
}
