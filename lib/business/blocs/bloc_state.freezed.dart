// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BlocState<F, T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(F failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(F failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(F failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<F, T> value) initial,
    required TResult Function(Loading<F, T> value) loading,
    required TResult Function(Success<F, T> value) success,
    required TResult Function(Error<F, T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<F, T> value)? initial,
    TResult? Function(Loading<F, T> value)? loading,
    TResult? Function(Success<F, T> value)? success,
    TResult? Function(Error<F, T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<F, T> value)? initial,
    TResult Function(Loading<F, T> value)? loading,
    TResult Function(Success<F, T> value)? success,
    TResult Function(Error<F, T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlocStateCopyWith<F, T, $Res> {
  factory $BlocStateCopyWith(
          BlocState<F, T> value, $Res Function(BlocState<F, T>) then) =
      _$BlocStateCopyWithImpl<F, T, $Res, BlocState<F, T>>;
}

/// @nodoc
class _$BlocStateCopyWithImpl<F, T, $Res, $Val extends BlocState<F, T>>
    implements $BlocStateCopyWith<F, T, $Res> {
  _$BlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<F, T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<F, T> value, $Res Function(_$InitialImpl<F, T>) then) =
      __$$InitialImplCopyWithImpl<F, T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<F, T, $Res>
    extends _$BlocStateCopyWithImpl<F, T, $Res, _$InitialImpl<F, T>>
    implements _$$InitialImplCopyWith<F, T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<F, T> _value, $Res Function(_$InitialImpl<F, T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<F, T>
    with DiagnosticableTreeMixin
    implements Initial<F, T> {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BlocState<$F, $T>.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'BlocState<$F, $T>.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<F, T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(F failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(F failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(F failure)? error,
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
    required TResult Function(Initial<F, T> value) initial,
    required TResult Function(Loading<F, T> value) loading,
    required TResult Function(Success<F, T> value) success,
    required TResult Function(Error<F, T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<F, T> value)? initial,
    TResult? Function(Loading<F, T> value)? loading,
    TResult? Function(Success<F, T> value)? success,
    TResult? Function(Error<F, T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<F, T> value)? initial,
    TResult Function(Loading<F, T> value)? loading,
    TResult Function(Success<F, T> value)? success,
    TResult Function(Error<F, T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial<F, T> implements BlocState<F, T> {
  const factory Initial() = _$InitialImpl<F, T>;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<F, T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<F, T> value, $Res Function(_$LoadingImpl<F, T>) then) =
      __$$LoadingImplCopyWithImpl<F, T, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<F, T, $Res>
    extends _$BlocStateCopyWithImpl<F, T, $Res, _$LoadingImpl<F, T>>
    implements _$$LoadingImplCopyWith<F, T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<F, T> _value, $Res Function(_$LoadingImpl<F, T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl<F, T>
    with DiagnosticableTreeMixin
    implements Loading<F, T> {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BlocState<$F, $T>.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'BlocState<$F, $T>.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl<F, T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(F failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(F failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(F failure)? error,
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
    required TResult Function(Initial<F, T> value) initial,
    required TResult Function(Loading<F, T> value) loading,
    required TResult Function(Success<F, T> value) success,
    required TResult Function(Error<F, T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<F, T> value)? initial,
    TResult? Function(Loading<F, T> value)? loading,
    TResult? Function(Success<F, T> value)? success,
    TResult? Function(Error<F, T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<F, T> value)? initial,
    TResult Function(Loading<F, T> value)? loading,
    TResult Function(Success<F, T> value)? success,
    TResult Function(Error<F, T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<F, T> implements BlocState<F, T> {
  const factory Loading() = _$LoadingImpl<F, T>;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<F, T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<F, T> value, $Res Function(_$SuccessImpl<F, T>) then) =
      __$$SuccessImplCopyWithImpl<F, T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<F, T, $Res>
    extends _$BlocStateCopyWithImpl<F, T, $Res, _$SuccessImpl<F, T>>
    implements _$$SuccessImplCopyWith<F, T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<F, T> _value, $Res Function(_$SuccessImpl<F, T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl<F, T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<F, T>
    with DiagnosticableTreeMixin
    implements Success<F, T> {
  const _$SuccessImpl({required this.data});

  @override
  final T data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BlocState<$F, $T>.success(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BlocState<$F, $T>.success'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<F, T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<F, T, _$SuccessImpl<F, T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<F, T, _$SuccessImpl<F, T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(F failure) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(F failure)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(F failure)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<F, T> value) initial,
    required TResult Function(Loading<F, T> value) loading,
    required TResult Function(Success<F, T> value) success,
    required TResult Function(Error<F, T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<F, T> value)? initial,
    TResult? Function(Loading<F, T> value)? loading,
    TResult? Function(Success<F, T> value)? success,
    TResult? Function(Error<F, T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<F, T> value)? initial,
    TResult Function(Loading<F, T> value)? loading,
    TResult Function(Success<F, T> value)? success,
    TResult Function(Error<F, T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<F, T> implements BlocState<F, T> {
  const factory Success({required final T data}) = _$SuccessImpl<F, T>;

  T get data;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<F, T, _$SuccessImpl<F, T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<F, T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<F, T> value, $Res Function(_$ErrorImpl<F, T>) then) =
      __$$ErrorImplCopyWithImpl<F, T, $Res>;
  @useResult
  $Res call({F failure});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<F, T, $Res>
    extends _$BlocStateCopyWithImpl<F, T, $Res, _$ErrorImpl<F, T>>
    implements _$$ErrorImplCopyWith<F, T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<F, T> _value, $Res Function(_$ErrorImpl<F, T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$ErrorImpl<F, T>(
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as F,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<F, T> with DiagnosticableTreeMixin implements Error<F, T> {
  const _$ErrorImpl({required this.failure});

  @override
  final F failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BlocState<$F, $T>.error(failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BlocState<$F, $T>.error'))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<F, T> &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<F, T, _$ErrorImpl<F, T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<F, T, _$ErrorImpl<F, T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(F failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(F failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(F failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<F, T> value) initial,
    required TResult Function(Loading<F, T> value) loading,
    required TResult Function(Success<F, T> value) success,
    required TResult Function(Error<F, T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<F, T> value)? initial,
    TResult? Function(Loading<F, T> value)? loading,
    TResult? Function(Success<F, T> value)? success,
    TResult? Function(Error<F, T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<F, T> value)? initial,
    TResult Function(Loading<F, T> value)? loading,
    TResult Function(Success<F, T> value)? success,
    TResult Function(Error<F, T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<F, T> implements BlocState<F, T> {
  const factory Error({required final F failure}) = _$ErrorImpl<F, T>;

  F get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<F, T, _$ErrorImpl<F, T>> get copyWith =>
      throw _privateConstructorUsedError;
}
