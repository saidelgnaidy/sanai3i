// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bookmark_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookmarksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<KUser> bookmarks) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<KUser> bookmarks)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<KUser> bookmarks)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksStateLoading value) loading,
    required TResult Function(BookmarksStateSuccess value) success,
    required TResult Function(BookmarksStateEmpty value) empty,
    required TResult Function(BookmarksStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BookmarksStateLoading value)? loading,
    TResult Function(BookmarksStateSuccess value)? success,
    TResult Function(BookmarksStateEmpty value)? empty,
    TResult Function(BookmarksStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksStateLoading value)? loading,
    TResult Function(BookmarksStateSuccess value)? success,
    TResult Function(BookmarksStateEmpty value)? empty,
    TResult Function(BookmarksStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarksStateCopyWith<$Res> {
  factory $BookmarksStateCopyWith(
          BookmarksState value, $Res Function(BookmarksState) then) =
      _$BookmarksStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksStateCopyWithImpl<$Res>
    implements $BookmarksStateCopyWith<$Res> {
  _$BookmarksStateCopyWithImpl(this._value, this._then);

  final BookmarksState _value;
  // ignore: unused_field
  final $Res Function(BookmarksState) _then;
}

/// @nodoc
abstract class _$$BookmarksStateLoadingCopyWith<$Res> {
  factory _$$BookmarksStateLoadingCopyWith(_$BookmarksStateLoading value,
          $Res Function(_$BookmarksStateLoading) then) =
      __$$BookmarksStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BookmarksStateLoadingCopyWithImpl<$Res>
    extends _$BookmarksStateCopyWithImpl<$Res>
    implements _$$BookmarksStateLoadingCopyWith<$Res> {
  __$$BookmarksStateLoadingCopyWithImpl(_$BookmarksStateLoading _value,
      $Res Function(_$BookmarksStateLoading) _then)
      : super(_value, (v) => _then(v as _$BookmarksStateLoading));

  @override
  _$BookmarksStateLoading get _value => super._value as _$BookmarksStateLoading;
}

/// @nodoc

class _$BookmarksStateLoading implements BookmarksStateLoading {
  const _$BookmarksStateLoading();

  @override
  String toString() {
    return 'BookmarksState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BookmarksStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<KUser> bookmarks) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<KUser> bookmarks)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<KUser> bookmarks)? success,
    TResult Function()? empty,
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
    required TResult Function(BookmarksStateLoading value) loading,
    required TResult Function(BookmarksStateSuccess value) success,
    required TResult Function(BookmarksStateEmpty value) empty,
    required TResult Function(BookmarksStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BookmarksStateLoading value)? loading,
    TResult Function(BookmarksStateSuccess value)? success,
    TResult Function(BookmarksStateEmpty value)? empty,
    TResult Function(BookmarksStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksStateLoading value)? loading,
    TResult Function(BookmarksStateSuccess value)? success,
    TResult Function(BookmarksStateEmpty value)? empty,
    TResult Function(BookmarksStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BookmarksStateLoading implements BookmarksState {
  const factory BookmarksStateLoading() = _$BookmarksStateLoading;
}

/// @nodoc
abstract class _$$BookmarksStateSuccessCopyWith<$Res> {
  factory _$$BookmarksStateSuccessCopyWith(_$BookmarksStateSuccess value,
          $Res Function(_$BookmarksStateSuccess) then) =
      __$$BookmarksStateSuccessCopyWithImpl<$Res>;
  $Res call({List<KUser> bookmarks});
}

/// @nodoc
class __$$BookmarksStateSuccessCopyWithImpl<$Res>
    extends _$BookmarksStateCopyWithImpl<$Res>
    implements _$$BookmarksStateSuccessCopyWith<$Res> {
  __$$BookmarksStateSuccessCopyWithImpl(_$BookmarksStateSuccess _value,
      $Res Function(_$BookmarksStateSuccess) _then)
      : super(_value, (v) => _then(v as _$BookmarksStateSuccess));

  @override
  _$BookmarksStateSuccess get _value => super._value as _$BookmarksStateSuccess;

  @override
  $Res call({
    Object? bookmarks = freezed,
  }) {
    return _then(_$BookmarksStateSuccess(
      bookmarks: bookmarks == freezed
          ? _value._bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<KUser>,
    ));
  }
}

/// @nodoc

class _$BookmarksStateSuccess implements BookmarksStateSuccess {
  const _$BookmarksStateSuccess({required final List<KUser> bookmarks})
      : _bookmarks = bookmarks;

  final List<KUser> _bookmarks;
  @override
  List<KUser> get bookmarks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarks);
  }

  @override
  String toString() {
    return 'BookmarksState.success(bookmarks: $bookmarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarksStateSuccess &&
            const DeepCollectionEquality()
                .equals(other._bookmarks, _bookmarks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_bookmarks));

  @JsonKey(ignore: true)
  @override
  _$$BookmarksStateSuccessCopyWith<_$BookmarksStateSuccess> get copyWith =>
      __$$BookmarksStateSuccessCopyWithImpl<_$BookmarksStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<KUser> bookmarks) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return success(bookmarks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<KUser> bookmarks)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
  }) {
    return success?.call(bookmarks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<KUser> bookmarks)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(bookmarks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksStateLoading value) loading,
    required TResult Function(BookmarksStateSuccess value) success,
    required TResult Function(BookmarksStateEmpty value) empty,
    required TResult Function(BookmarksStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BookmarksStateLoading value)? loading,
    TResult Function(BookmarksStateSuccess value)? success,
    TResult Function(BookmarksStateEmpty value)? empty,
    TResult Function(BookmarksStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksStateLoading value)? loading,
    TResult Function(BookmarksStateSuccess value)? success,
    TResult Function(BookmarksStateEmpty value)? empty,
    TResult Function(BookmarksStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class BookmarksStateSuccess implements BookmarksState {
  const factory BookmarksStateSuccess({required final List<KUser> bookmarks}) =
      _$BookmarksStateSuccess;

  List<KUser> get bookmarks => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$BookmarksStateSuccessCopyWith<_$BookmarksStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookmarksStateEmptyCopyWith<$Res> {
  factory _$$BookmarksStateEmptyCopyWith(_$BookmarksStateEmpty value,
          $Res Function(_$BookmarksStateEmpty) then) =
      __$$BookmarksStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BookmarksStateEmptyCopyWithImpl<$Res>
    extends _$BookmarksStateCopyWithImpl<$Res>
    implements _$$BookmarksStateEmptyCopyWith<$Res> {
  __$$BookmarksStateEmptyCopyWithImpl(
      _$BookmarksStateEmpty _value, $Res Function(_$BookmarksStateEmpty) _then)
      : super(_value, (v) => _then(v as _$BookmarksStateEmpty));

  @override
  _$BookmarksStateEmpty get _value => super._value as _$BookmarksStateEmpty;
}

/// @nodoc

class _$BookmarksStateEmpty implements BookmarksStateEmpty {
  const _$BookmarksStateEmpty();

  @override
  String toString() {
    return 'BookmarksState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BookmarksStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<KUser> bookmarks) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<KUser> bookmarks)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<KUser> bookmarks)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksStateLoading value) loading,
    required TResult Function(BookmarksStateSuccess value) success,
    required TResult Function(BookmarksStateEmpty value) empty,
    required TResult Function(BookmarksStateError value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BookmarksStateLoading value)? loading,
    TResult Function(BookmarksStateSuccess value)? success,
    TResult Function(BookmarksStateEmpty value)? empty,
    TResult Function(BookmarksStateError value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksStateLoading value)? loading,
    TResult Function(BookmarksStateSuccess value)? success,
    TResult Function(BookmarksStateEmpty value)? empty,
    TResult Function(BookmarksStateError value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class BookmarksStateEmpty implements BookmarksState {
  const factory BookmarksStateEmpty() = _$BookmarksStateEmpty;
}

/// @nodoc
abstract class _$$BookmarksStateErrorCopyWith<$Res> {
  factory _$$BookmarksStateErrorCopyWith(_$BookmarksStateError value,
          $Res Function(_$BookmarksStateError) then) =
      __$$BookmarksStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$BookmarksStateErrorCopyWithImpl<$Res>
    extends _$BookmarksStateCopyWithImpl<$Res>
    implements _$$BookmarksStateErrorCopyWith<$Res> {
  __$$BookmarksStateErrorCopyWithImpl(
      _$BookmarksStateError _value, $Res Function(_$BookmarksStateError) _then)
      : super(_value, (v) => _then(v as _$BookmarksStateError));

  @override
  _$BookmarksStateError get _value => super._value as _$BookmarksStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$BookmarksStateError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BookmarksStateError implements BookmarksStateError {
  const _$BookmarksStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'BookmarksState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarksStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$BookmarksStateErrorCopyWith<_$BookmarksStateError> get copyWith =>
      __$$BookmarksStateErrorCopyWithImpl<_$BookmarksStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<KUser> bookmarks) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<KUser> bookmarks)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<KUser> bookmarks)? success,
    TResult Function()? empty,
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
    required TResult Function(BookmarksStateLoading value) loading,
    required TResult Function(BookmarksStateSuccess value) success,
    required TResult Function(BookmarksStateEmpty value) empty,
    required TResult Function(BookmarksStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BookmarksStateLoading value)? loading,
    TResult Function(BookmarksStateSuccess value)? success,
    TResult Function(BookmarksStateEmpty value)? empty,
    TResult Function(BookmarksStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksStateLoading value)? loading,
    TResult Function(BookmarksStateSuccess value)? success,
    TResult Function(BookmarksStateEmpty value)? empty,
    TResult Function(BookmarksStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BookmarksStateError implements BookmarksState {
  const factory BookmarksStateError({required final String error}) =
      _$BookmarksStateError;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$BookmarksStateErrorCopyWith<_$BookmarksStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
