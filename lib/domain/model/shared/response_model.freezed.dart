// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResponseModel<T> {
  Object? get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) successResponse,
    required TResult Function(GenericResponseModel data) errorResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? successResponse,
    TResult? Function(GenericResponseModel data)? errorResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? successResponse,
    TResult Function(GenericResponseModel data)? errorResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessResponse<T> value) successResponse,
    required TResult Function(ErrorResponse<T> value) errorResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessResponse<T> value)? successResponse,
    TResult? Function(ErrorResponse<T> value)? errorResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessResponse<T> value)? successResponse,
    TResult Function(ErrorResponse<T> value)? errorResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseModelCopyWith<T, $Res> {
  factory $ResponseModelCopyWith(
          ResponseModel<T> value, $Res Function(ResponseModel<T>) then) =
      _$ResponseModelCopyWithImpl<T, $Res, ResponseModel<T>>;
}

/// @nodoc
class _$ResponseModelCopyWithImpl<T, $Res, $Val extends ResponseModel<T>>
    implements $ResponseModelCopyWith<T, $Res> {
  _$ResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessResponseImplCopyWith<T, $Res> {
  factory _$$SuccessResponseImplCopyWith(_$SuccessResponseImpl<T> value,
          $Res Function(_$SuccessResponseImpl<T>) then) =
      __$$SuccessResponseImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessResponseImplCopyWithImpl<T, $Res>
    extends _$ResponseModelCopyWithImpl<T, $Res, _$SuccessResponseImpl<T>>
    implements _$$SuccessResponseImplCopyWith<T, $Res> {
  __$$SuccessResponseImplCopyWithImpl(_$SuccessResponseImpl<T> _value,
      $Res Function(_$SuccessResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessResponseImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessResponseImpl<T> implements SuccessResponse<T> {
  const _$SuccessResponseImpl({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'ResponseModel<$T>.successResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessResponseImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessResponseImplCopyWith<T, _$SuccessResponseImpl<T>> get copyWith =>
      __$$SuccessResponseImplCopyWithImpl<T, _$SuccessResponseImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) successResponse,
    required TResult Function(GenericResponseModel data) errorResponse,
  }) {
    return successResponse(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? successResponse,
    TResult? Function(GenericResponseModel data)? errorResponse,
  }) {
    return successResponse?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? successResponse,
    TResult Function(GenericResponseModel data)? errorResponse,
    required TResult orElse(),
  }) {
    if (successResponse != null) {
      return successResponse(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessResponse<T> value) successResponse,
    required TResult Function(ErrorResponse<T> value) errorResponse,
  }) {
    return successResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessResponse<T> value)? successResponse,
    TResult? Function(ErrorResponse<T> value)? errorResponse,
  }) {
    return successResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessResponse<T> value)? successResponse,
    TResult Function(ErrorResponse<T> value)? errorResponse,
    required TResult orElse(),
  }) {
    if (successResponse != null) {
      return successResponse(this);
    }
    return orElse();
  }
}

abstract class SuccessResponse<T> implements ResponseModel<T> {
  const factory SuccessResponse({required final T data}) =
      _$SuccessResponseImpl<T>;

  @override
  T get data;
  @JsonKey(ignore: true)
  _$$SuccessResponseImplCopyWith<T, _$SuccessResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorResponseImplCopyWith<T, $Res> {
  factory _$$ErrorResponseImplCopyWith(_$ErrorResponseImpl<T> value,
          $Res Function(_$ErrorResponseImpl<T>) then) =
      __$$ErrorResponseImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({GenericResponseModel data});
}

/// @nodoc
class __$$ErrorResponseImplCopyWithImpl<T, $Res>
    extends _$ResponseModelCopyWithImpl<T, $Res, _$ErrorResponseImpl<T>>
    implements _$$ErrorResponseImplCopyWith<T, $Res> {
  __$$ErrorResponseImplCopyWithImpl(_$ErrorResponseImpl<T> _value,
      $Res Function(_$ErrorResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ErrorResponseImpl<T>(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GenericResponseModel,
    ));
  }
}

/// @nodoc

class _$ErrorResponseImpl<T> implements ErrorResponse<T> {
  const _$ErrorResponseImpl({required this.data});

  @override
  final GenericResponseModel data;

  @override
  String toString() {
    return 'ResponseModel<$T>.errorResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorResponseImpl<T> &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorResponseImplCopyWith<T, _$ErrorResponseImpl<T>> get copyWith =>
      __$$ErrorResponseImplCopyWithImpl<T, _$ErrorResponseImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) successResponse,
    required TResult Function(GenericResponseModel data) errorResponse,
  }) {
    return errorResponse(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? successResponse,
    TResult? Function(GenericResponseModel data)? errorResponse,
  }) {
    return errorResponse?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? successResponse,
    TResult Function(GenericResponseModel data)? errorResponse,
    required TResult orElse(),
  }) {
    if (errorResponse != null) {
      return errorResponse(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessResponse<T> value) successResponse,
    required TResult Function(ErrorResponse<T> value) errorResponse,
  }) {
    return errorResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessResponse<T> value)? successResponse,
    TResult? Function(ErrorResponse<T> value)? errorResponse,
  }) {
    return errorResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessResponse<T> value)? successResponse,
    TResult Function(ErrorResponse<T> value)? errorResponse,
    required TResult orElse(),
  }) {
    if (errorResponse != null) {
      return errorResponse(this);
    }
    return orElse();
  }
}

abstract class ErrorResponse<T> implements ResponseModel<T> {
  const factory ErrorResponse({required final GenericResponseModel data}) =
      _$ErrorResponseImpl<T>;

  @override
  GenericResponseModel get data;
  @JsonKey(ignore: true)
  _$$ErrorResponseImplCopyWith<T, _$ErrorResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
