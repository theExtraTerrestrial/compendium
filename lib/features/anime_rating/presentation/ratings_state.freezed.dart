// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ratings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RatingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
      List<AnimeRatingModel> items,
      Set<int> savingIds,
      String? errorMessage,
    )
    loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
      List<AnimeRatingModel> items,
      Set<int> savingIds,
      String? errorMessage,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
      List<AnimeRatingModel> items,
      Set<int> savingIds,
      String? errorMessage,
    )?
    loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RatingsLoading value) loading,
    required TResult Function(RatingsLoaded value) loaded,
    required TResult Function(RatingsError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RatingsLoading value)? loading,
    TResult? Function(RatingsLoaded value)? loaded,
    TResult? Function(RatingsError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RatingsLoading value)? loading,
    TResult Function(RatingsLoaded value)? loaded,
    TResult Function(RatingsError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingsStateCopyWith<$Res> {
  factory $RatingsStateCopyWith(
    RatingsState value,
    $Res Function(RatingsState) then,
  ) = _$RatingsStateCopyWithImpl<$Res, RatingsState>;
}

/// @nodoc
class _$RatingsStateCopyWithImpl<$Res, $Val extends RatingsState>
    implements $RatingsStateCopyWith<$Res> {
  _$RatingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RatingsLoadingImplCopyWith<$Res> {
  factory _$$RatingsLoadingImplCopyWith(
    _$RatingsLoadingImpl value,
    $Res Function(_$RatingsLoadingImpl) then,
  ) = __$$RatingsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RatingsLoadingImplCopyWithImpl<$Res>
    extends _$RatingsStateCopyWithImpl<$Res, _$RatingsLoadingImpl>
    implements _$$RatingsLoadingImplCopyWith<$Res> {
  __$$RatingsLoadingImplCopyWithImpl(
    _$RatingsLoadingImpl _value,
    $Res Function(_$RatingsLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RatingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RatingsLoadingImpl implements RatingsLoading {
  const _$RatingsLoadingImpl();

  @override
  String toString() {
    return 'RatingsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RatingsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
      List<AnimeRatingModel> items,
      Set<int> savingIds,
      String? errorMessage,
    )
    loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
      List<AnimeRatingModel> items,
      Set<int> savingIds,
      String? errorMessage,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
      List<AnimeRatingModel> items,
      Set<int> savingIds,
      String? errorMessage,
    )?
    loaded,
    TResult Function(String message)? error,
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
    required TResult Function(RatingsLoading value) loading,
    required TResult Function(RatingsLoaded value) loaded,
    required TResult Function(RatingsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RatingsLoading value)? loading,
    TResult? Function(RatingsLoaded value)? loaded,
    TResult? Function(RatingsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RatingsLoading value)? loading,
    TResult Function(RatingsLoaded value)? loaded,
    TResult Function(RatingsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RatingsLoading implements RatingsState {
  const factory RatingsLoading() = _$RatingsLoadingImpl;
}

/// @nodoc
abstract class _$$RatingsLoadedImplCopyWith<$Res> {
  factory _$$RatingsLoadedImplCopyWith(
    _$RatingsLoadedImpl value,
    $Res Function(_$RatingsLoadedImpl) then,
  ) = __$$RatingsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    List<AnimeRatingModel> items,
    Set<int> savingIds,
    String? errorMessage,
  });
}

/// @nodoc
class __$$RatingsLoadedImplCopyWithImpl<$Res>
    extends _$RatingsStateCopyWithImpl<$Res, _$RatingsLoadedImpl>
    implements _$$RatingsLoadedImplCopyWith<$Res> {
  __$$RatingsLoadedImplCopyWithImpl(
    _$RatingsLoadedImpl _value,
    $Res Function(_$RatingsLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RatingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? savingIds = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$RatingsLoadedImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<AnimeRatingModel>,
        savingIds: null == savingIds
            ? _value._savingIds
            : savingIds // ignore: cast_nullable_to_non_nullable
                  as Set<int>,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$RatingsLoadedImpl implements RatingsLoaded {
  const _$RatingsLoadedImpl({
    required final List<AnimeRatingModel> items,
    final Set<int> savingIds = const <int>{},
    this.errorMessage,
  }) : _items = items,
       _savingIds = savingIds;

  final List<AnimeRatingModel> _items;
  @override
  List<AnimeRatingModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final Set<int> _savingIds;
  @override
  @JsonKey()
  Set<int> get savingIds {
    if (_savingIds is EqualUnmodifiableSetView) return _savingIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_savingIds);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'RatingsState.loaded(items: $items, savingIds: $savingIds, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingsLoadedImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(
              other._savingIds,
              _savingIds,
            ) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    const DeepCollectionEquality().hash(_savingIds),
    errorMessage,
  );

  /// Create a copy of RatingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingsLoadedImplCopyWith<_$RatingsLoadedImpl> get copyWith =>
      __$$RatingsLoadedImplCopyWithImpl<_$RatingsLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
      List<AnimeRatingModel> items,
      Set<int> savingIds,
      String? errorMessage,
    )
    loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(items, savingIds, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
      List<AnimeRatingModel> items,
      Set<int> savingIds,
      String? errorMessage,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(items, savingIds, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
      List<AnimeRatingModel> items,
      Set<int> savingIds,
      String? errorMessage,
    )?
    loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items, savingIds, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RatingsLoading value) loading,
    required TResult Function(RatingsLoaded value) loaded,
    required TResult Function(RatingsError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RatingsLoading value)? loading,
    TResult? Function(RatingsLoaded value)? loaded,
    TResult? Function(RatingsError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RatingsLoading value)? loading,
    TResult Function(RatingsLoaded value)? loaded,
    TResult Function(RatingsError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RatingsLoaded implements RatingsState {
  const factory RatingsLoaded({
    required final List<AnimeRatingModel> items,
    final Set<int> savingIds,
    final String? errorMessage,
  }) = _$RatingsLoadedImpl;

  List<AnimeRatingModel> get items;
  Set<int> get savingIds;
  String? get errorMessage;

  /// Create a copy of RatingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingsLoadedImplCopyWith<_$RatingsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RatingsErrorImplCopyWith<$Res> {
  factory _$$RatingsErrorImplCopyWith(
    _$RatingsErrorImpl value,
    $Res Function(_$RatingsErrorImpl) then,
  ) = __$$RatingsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RatingsErrorImplCopyWithImpl<$Res>
    extends _$RatingsStateCopyWithImpl<$Res, _$RatingsErrorImpl>
    implements _$$RatingsErrorImplCopyWith<$Res> {
  __$$RatingsErrorImplCopyWithImpl(
    _$RatingsErrorImpl _value,
    $Res Function(_$RatingsErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RatingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$RatingsErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RatingsErrorImpl implements RatingsError {
  const _$RatingsErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RatingsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingsErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RatingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingsErrorImplCopyWith<_$RatingsErrorImpl> get copyWith =>
      __$$RatingsErrorImplCopyWithImpl<_$RatingsErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
      List<AnimeRatingModel> items,
      Set<int> savingIds,
      String? errorMessage,
    )
    loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
      List<AnimeRatingModel> items,
      Set<int> savingIds,
      String? errorMessage,
    )?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
      List<AnimeRatingModel> items,
      Set<int> savingIds,
      String? errorMessage,
    )?
    loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RatingsLoading value) loading,
    required TResult Function(RatingsLoaded value) loaded,
    required TResult Function(RatingsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RatingsLoading value)? loading,
    TResult? Function(RatingsLoaded value)? loaded,
    TResult? Function(RatingsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RatingsLoading value)? loading,
    TResult Function(RatingsLoaded value)? loaded,
    TResult Function(RatingsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RatingsError implements RatingsState {
  const factory RatingsError(final String message) = _$RatingsErrorImpl;

  String get message;

  /// Create a copy of RatingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingsErrorImplCopyWith<_$RatingsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
