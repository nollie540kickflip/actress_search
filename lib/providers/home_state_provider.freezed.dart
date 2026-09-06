// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  List<Actress> get actresses => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  int? get minBust => throw _privateConstructorUsedError;
  SortOrder get sortOrder => throw _privateConstructorUsedError;
  bool get onlyFavorites => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<Actress> actresses,
      bool isLoading,
      String searchQuery,
      int? minBust,
      SortOrder sortOrder,
      bool onlyFavorites});
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
    Object? actresses = null,
    Object? isLoading = null,
    Object? searchQuery = null,
    Object? minBust = freezed,
    Object? sortOrder = null,
    Object? onlyFavorites = null,
  }) {
    return _then(_value.copyWith(
      actresses: null == actresses
          ? _value.actresses
          : actresses // ignore: cast_nullable_to_non_nullable
              as List<Actress>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      minBust: freezed == minBust
          ? _value.minBust
          : minBust // ignore: cast_nullable_to_non_nullable
              as int?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
      onlyFavorites: null == onlyFavorites
          ? _value.onlyFavorites
          : onlyFavorites // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Actress> actresses,
      bool isLoading,
      String searchQuery,
      int? minBust,
      SortOrder sortOrder,
      bool onlyFavorites});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actresses = null,
    Object? isLoading = null,
    Object? searchQuery = null,
    Object? minBust = freezed,
    Object? sortOrder = null,
    Object? onlyFavorites = null,
  }) {
    return _then(_$_HomeState(
      actresses: null == actresses
          ? _value._actresses
          : actresses // ignore: cast_nullable_to_non_nullable
              as List<Actress>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      minBust: freezed == minBust
          ? _value.minBust
          : minBust // ignore: cast_nullable_to_non_nullable
              as int?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
      onlyFavorites: null == onlyFavorites
          ? _value.onlyFavorites
          : onlyFavorites // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {final List<Actress> actresses = const [],
      this.isLoading = false,
      this.searchQuery = '',
      this.minBust,
      this.sortOrder = SortOrder.birthDateDesc,
      this.onlyFavorites = false})
      : _actresses = actresses;

  final List<Actress> _actresses;
  @override
  @JsonKey()
  List<Actress> get actresses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actresses);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  final int? minBust;
  @override
  @JsonKey()
  final SortOrder sortOrder;
  @override
  @JsonKey()
  final bool onlyFavorites;

  @override
  String toString() {
    return 'HomeState(actresses: $actresses, isLoading: $isLoading, searchQuery: $searchQuery, minBust: $minBust, sortOrder: $sortOrder, onlyFavorites: $onlyFavorites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality()
                .equals(other._actresses, _actresses) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.minBust, minBust) || other.minBust == minBust) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.onlyFavorites, onlyFavorites) ||
                other.onlyFavorites == onlyFavorites));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_actresses),
      isLoading,
      searchQuery,
      minBust,
      sortOrder,
      onlyFavorites);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final List<Actress> actresses,
      final bool isLoading,
      final String searchQuery,
      final int? minBust,
      final SortOrder sortOrder,
      final bool onlyFavorites}) = _$_HomeState;

  @override
  List<Actress> get actresses;
  @override
  bool get isLoading;
  @override
  String get searchQuery;
  @override
  int? get minBust;
  @override
  SortOrder get sortOrder;
  @override
  bool get onlyFavorites;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
