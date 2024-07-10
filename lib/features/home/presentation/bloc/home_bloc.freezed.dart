// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  int? get limit => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, int? offset) fetchPokemons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, int? offset)? fetchPokemons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, int? offset)? fetchPokemons,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPokemons value) fetchPokemons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPokemons value)? fetchPokemons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPokemons value)? fetchPokemons,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeEventCopyWith<HomeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
  @useResult
  $Res call({int? limit, int? offset});
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? offset = freezed,
  }) {
    return _then(_value.copyWith(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchPokemonsImplCopyWith<$Res>
    implements $HomeEventCopyWith<$Res> {
  factory _$$FetchPokemonsImplCopyWith(
          _$FetchPokemonsImpl value, $Res Function(_$FetchPokemonsImpl) then) =
      __$$FetchPokemonsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? limit, int? offset});
}

/// @nodoc
class __$$FetchPokemonsImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$FetchPokemonsImpl>
    implements _$$FetchPokemonsImplCopyWith<$Res> {
  __$$FetchPokemonsImplCopyWithImpl(
      _$FetchPokemonsImpl _value, $Res Function(_$FetchPokemonsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? offset = freezed,
  }) {
    return _then(_$FetchPokemonsImpl(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FetchPokemonsImpl implements _FetchPokemons {
  const _$FetchPokemonsImpl({this.limit, this.offset});

  @override
  final int? limit;
  @override
  final int? offset;

  @override
  String toString() {
    return 'HomeEvent.fetchPokemons(limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPokemonsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchPokemonsImplCopyWith<_$FetchPokemonsImpl> get copyWith =>
      __$$FetchPokemonsImplCopyWithImpl<_$FetchPokemonsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, int? offset) fetchPokemons,
  }) {
    return fetchPokemons(limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, int? offset)? fetchPokemons,
  }) {
    return fetchPokemons?.call(limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, int? offset)? fetchPokemons,
    required TResult orElse(),
  }) {
    if (fetchPokemons != null) {
      return fetchPokemons(limit, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPokemons value) fetchPokemons,
  }) {
    return fetchPokemons(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPokemons value)? fetchPokemons,
  }) {
    return fetchPokemons?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPokemons value)? fetchPokemons,
    required TResult orElse(),
  }) {
    if (fetchPokemons != null) {
      return fetchPokemons(this);
    }
    return orElse();
  }
}

abstract class _FetchPokemons implements HomeEvent {
  const factory _FetchPokemons({final int? limit, final int? offset}) =
      _$FetchPokemonsImpl;

  @override
  int? get limit;
  @override
  int? get offset;
  @override
  @JsonKey(ignore: true)
  _$$FetchPokemonsImplCopyWith<_$FetchPokemonsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  List<Pokemon> get pokemons => throw _privateConstructorUsedError;
  int get lastPokemonId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        initial,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        loading,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId) loaded,
    required TResult Function(
            List<Pokemon> pokemons, int lastPokemonId, String message)
        error,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        fetchingMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? initial,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? loading,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? loaded,
    TResult? Function(
            List<Pokemon> pokemons, int lastPokemonId, String message)?
        error,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? fetchingMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? initial,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? loading,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? loaded,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId, String message)?
        error,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? fetchingMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_FetchingMore value) fetchingMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_FetchingMore value)? fetchingMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_FetchingMore value)? fetchingMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({List<Pokemon> pokemons, int lastPokemonId});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = null,
    Object? lastPokemonId = null,
  }) {
    return _then(_value.copyWith(
      pokemons: null == pokemons
          ? _value.pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
      lastPokemonId: null == lastPokemonId
          ? _value.lastPokemonId
          : lastPokemonId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Pokemon> pokemons, int lastPokemonId});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = null,
    Object? lastPokemonId = null,
  }) {
    return _then(_$InitialImpl(
      null == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
      null == lastPokemonId
          ? _value.lastPokemonId
          : lastPokemonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(final List<Pokemon> pokemons, this.lastPokemonId)
      : _pokemons = pokemons;

  final List<Pokemon> _pokemons;
  @override
  List<Pokemon> get pokemons {
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemons);
  }

  @override
  final int lastPokemonId;

  @override
  String toString() {
    return 'HomeState.initial(pokemons: $pokemons, lastPokemonId: $lastPokemonId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons) &&
            (identical(other.lastPokemonId, lastPokemonId) ||
                other.lastPokemonId == lastPokemonId));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_pokemons), lastPokemonId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        initial,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        loading,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId) loaded,
    required TResult Function(
            List<Pokemon> pokemons, int lastPokemonId, String message)
        error,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        fetchingMore,
  }) {
    return initial(pokemons, lastPokemonId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? initial,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? loading,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? loaded,
    TResult? Function(
            List<Pokemon> pokemons, int lastPokemonId, String message)?
        error,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? fetchingMore,
  }) {
    return initial?.call(pokemons, lastPokemonId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? initial,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? loading,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? loaded,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId, String message)?
        error,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? fetchingMore,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(pokemons, lastPokemonId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_FetchingMore value) fetchingMore,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_FetchingMore value)? fetchingMore,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_FetchingMore value)? fetchingMore,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      final List<Pokemon> pokemons, final int lastPokemonId) = _$InitialImpl;

  @override
  List<Pokemon> get pokemons;
  @override
  int get lastPokemonId;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Pokemon> pokemons, int lastPokemonId});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = null,
    Object? lastPokemonId = null,
  }) {
    return _then(_$LoadingImpl(
      null == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
      null == lastPokemonId
          ? _value.lastPokemonId
          : lastPokemonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(final List<Pokemon> pokemons, this.lastPokemonId)
      : _pokemons = pokemons;

  final List<Pokemon> _pokemons;
  @override
  List<Pokemon> get pokemons {
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemons);
  }

  @override
  final int lastPokemonId;

  @override
  String toString() {
    return 'HomeState.loading(pokemons: $pokemons, lastPokemonId: $lastPokemonId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons) &&
            (identical(other.lastPokemonId, lastPokemonId) ||
                other.lastPokemonId == lastPokemonId));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_pokemons), lastPokemonId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        initial,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        loading,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId) loaded,
    required TResult Function(
            List<Pokemon> pokemons, int lastPokemonId, String message)
        error,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        fetchingMore,
  }) {
    return loading(pokemons, lastPokemonId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? initial,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? loading,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? loaded,
    TResult? Function(
            List<Pokemon> pokemons, int lastPokemonId, String message)?
        error,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? fetchingMore,
  }) {
    return loading?.call(pokemons, lastPokemonId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? initial,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? loading,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? loaded,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId, String message)?
        error,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? fetchingMore,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(pokemons, lastPokemonId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_FetchingMore value) fetchingMore,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_FetchingMore value)? fetchingMore,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_FetchingMore value)? fetchingMore,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomeState {
  const factory _Loading(
      final List<Pokemon> pokemons, final int lastPokemonId) = _$LoadingImpl;

  @override
  List<Pokemon> get pokemons;
  @override
  int get lastPokemonId;
  @override
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Pokemon> pokemons, int lastPokemonId});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = null,
    Object? lastPokemonId = null,
  }) {
    return _then(_$LoadedImpl(
      null == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
      null == lastPokemonId
          ? _value.lastPokemonId
          : lastPokemonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<Pokemon> pokemons, this.lastPokemonId)
      : _pokemons = pokemons;

  final List<Pokemon> _pokemons;
  @override
  List<Pokemon> get pokemons {
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemons);
  }

  @override
  final int lastPokemonId;

  @override
  String toString() {
    return 'HomeState.loaded(pokemons: $pokemons, lastPokemonId: $lastPokemonId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons) &&
            (identical(other.lastPokemonId, lastPokemonId) ||
                other.lastPokemonId == lastPokemonId));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_pokemons), lastPokemonId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        initial,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        loading,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId) loaded,
    required TResult Function(
            List<Pokemon> pokemons, int lastPokemonId, String message)
        error,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        fetchingMore,
  }) {
    return loaded(pokemons, lastPokemonId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? initial,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? loading,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? loaded,
    TResult? Function(
            List<Pokemon> pokemons, int lastPokemonId, String message)?
        error,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? fetchingMore,
  }) {
    return loaded?.call(pokemons, lastPokemonId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? initial,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? loading,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? loaded,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId, String message)?
        error,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? fetchingMore,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(pokemons, lastPokemonId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_FetchingMore value) fetchingMore,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_FetchingMore value)? fetchingMore,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_FetchingMore value)? fetchingMore,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements HomeState {
  const factory _Loaded(final List<Pokemon> pokemons, final int lastPokemonId) =
      _$LoadedImpl;

  @override
  List<Pokemon> get pokemons;
  @override
  int get lastPokemonId;
  @override
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Pokemon> pokemons, int lastPokemonId, String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = null,
    Object? lastPokemonId = null,
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
      null == lastPokemonId
          ? _value.lastPokemonId
          : lastPokemonId // ignore: cast_nullable_to_non_nullable
              as int,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(
      final List<Pokemon> pokemons, this.lastPokemonId, this.message)
      : _pokemons = pokemons;

  final List<Pokemon> _pokemons;
  @override
  List<Pokemon> get pokemons {
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemons);
  }

  @override
  final int lastPokemonId;
  @override
  final String message;

  @override
  String toString() {
    return 'HomeState.error(pokemons: $pokemons, lastPokemonId: $lastPokemonId, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons) &&
            (identical(other.lastPokemonId, lastPokemonId) ||
                other.lastPokemonId == lastPokemonId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_pokemons), lastPokemonId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        initial,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        loading,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId) loaded,
    required TResult Function(
            List<Pokemon> pokemons, int lastPokemonId, String message)
        error,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        fetchingMore,
  }) {
    return error(pokemons, lastPokemonId, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? initial,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? loading,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? loaded,
    TResult? Function(
            List<Pokemon> pokemons, int lastPokemonId, String message)?
        error,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? fetchingMore,
  }) {
    return error?.call(pokemons, lastPokemonId, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? initial,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? loading,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? loaded,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId, String message)?
        error,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? fetchingMore,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(pokemons, lastPokemonId, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_FetchingMore value) fetchingMore,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_FetchingMore value)? fetchingMore,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_FetchingMore value)? fetchingMore,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements HomeState {
  const factory _Error(final List<Pokemon> pokemons, final int lastPokemonId,
      final String message) = _$ErrorImpl;

  @override
  List<Pokemon> get pokemons;
  @override
  int get lastPokemonId;
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchingMoreImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$FetchingMoreImplCopyWith(
          _$FetchingMoreImpl value, $Res Function(_$FetchingMoreImpl) then) =
      __$$FetchingMoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Pokemon> pokemons, int lastPokemonId});
}

/// @nodoc
class __$$FetchingMoreImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$FetchingMoreImpl>
    implements _$$FetchingMoreImplCopyWith<$Res> {
  __$$FetchingMoreImplCopyWithImpl(
      _$FetchingMoreImpl _value, $Res Function(_$FetchingMoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = null,
    Object? lastPokemonId = null,
  }) {
    return _then(_$FetchingMoreImpl(
      null == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
      null == lastPokemonId
          ? _value.lastPokemonId
          : lastPokemonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchingMoreImpl implements _FetchingMore {
  const _$FetchingMoreImpl(final List<Pokemon> pokemons, this.lastPokemonId)
      : _pokemons = pokemons;

  final List<Pokemon> _pokemons;
  @override
  List<Pokemon> get pokemons {
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemons);
  }

  @override
  final int lastPokemonId;

  @override
  String toString() {
    return 'HomeState.fetchingMore(pokemons: $pokemons, lastPokemonId: $lastPokemonId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchingMoreImpl &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons) &&
            (identical(other.lastPokemonId, lastPokemonId) ||
                other.lastPokemonId == lastPokemonId));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_pokemons), lastPokemonId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchingMoreImplCopyWith<_$FetchingMoreImpl> get copyWith =>
      __$$FetchingMoreImplCopyWithImpl<_$FetchingMoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        initial,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        loading,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId) loaded,
    required TResult Function(
            List<Pokemon> pokemons, int lastPokemonId, String message)
        error,
    required TResult Function(List<Pokemon> pokemons, int lastPokemonId)
        fetchingMore,
  }) {
    return fetchingMore(pokemons, lastPokemonId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? initial,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? loading,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? loaded,
    TResult? Function(
            List<Pokemon> pokemons, int lastPokemonId, String message)?
        error,
    TResult? Function(List<Pokemon> pokemons, int lastPokemonId)? fetchingMore,
  }) {
    return fetchingMore?.call(pokemons, lastPokemonId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? initial,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? loading,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? loaded,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId, String message)?
        error,
    TResult Function(List<Pokemon> pokemons, int lastPokemonId)? fetchingMore,
    required TResult orElse(),
  }) {
    if (fetchingMore != null) {
      return fetchingMore(pokemons, lastPokemonId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_FetchingMore value) fetchingMore,
  }) {
    return fetchingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_FetchingMore value)? fetchingMore,
  }) {
    return fetchingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_FetchingMore value)? fetchingMore,
    required TResult orElse(),
  }) {
    if (fetchingMore != null) {
      return fetchingMore(this);
    }
    return orElse();
  }
}

abstract class _FetchingMore implements HomeState {
  const factory _FetchingMore(
          final List<Pokemon> pokemons, final int lastPokemonId) =
      _$FetchingMoreImpl;

  @override
  List<Pokemon> get pokemons;
  @override
  int get lastPokemonId;
  @override
  @JsonKey(ignore: true)
  _$$FetchingMoreImplCopyWith<_$FetchingMoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
