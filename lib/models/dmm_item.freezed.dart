// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dmm_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DmmItem _$DmmItemFromJson(Map<String, dynamic> json) {
  return _DmmItem.fromJson(json);
}

/// @nodoc
mixin _$DmmItem {
  @JsonKey(name: 'content_id')
  String get contentId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageURL', fromJson: _imageUrlFromJson)
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readUrl)
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DmmItemCopyWith<DmmItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DmmItemCopyWith<$Res> {
  factory $DmmItemCopyWith(DmmItem value, $Res Function(DmmItem) then) =
      _$DmmItemCopyWithImpl<$Res, DmmItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'content_id') String contentId,
      String title,
      @JsonKey(name: 'imageURL', fromJson: _imageUrlFromJson) String? imageUrl,
      String? date,
      @JsonKey(readValue: _readUrl) String? url});
}

/// @nodoc
class _$DmmItemCopyWithImpl<$Res, $Val extends DmmItem>
    implements $DmmItemCopyWith<$Res> {
  _$DmmItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? title = null,
    Object? imageUrl = freezed,
    Object? date = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DmmItemCopyWith<$Res> implements $DmmItemCopyWith<$Res> {
  factory _$$_DmmItemCopyWith(
          _$_DmmItem value, $Res Function(_$_DmmItem) then) =
      __$$_DmmItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'content_id') String contentId,
      String title,
      @JsonKey(name: 'imageURL', fromJson: _imageUrlFromJson) String? imageUrl,
      String? date,
      @JsonKey(readValue: _readUrl) String? url});
}

/// @nodoc
class __$$_DmmItemCopyWithImpl<$Res>
    extends _$DmmItemCopyWithImpl<$Res, _$_DmmItem>
    implements _$$_DmmItemCopyWith<$Res> {
  __$$_DmmItemCopyWithImpl(_$_DmmItem _value, $Res Function(_$_DmmItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? title = null,
    Object? imageUrl = freezed,
    Object? date = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_DmmItem(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DmmItem implements _DmmItem {
  const _$_DmmItem(
      {@JsonKey(name: 'content_id') this.contentId = '',
      this.title = 'タイトル不明',
      @JsonKey(name: 'imageURL', fromJson: _imageUrlFromJson) this.imageUrl,
      this.date,
      @JsonKey(readValue: _readUrl) this.url});

  factory _$_DmmItem.fromJson(Map<String, dynamic> json) =>
      _$$_DmmItemFromJson(json);

  @override
  @JsonKey(name: 'content_id')
  final String contentId;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey(name: 'imageURL', fromJson: _imageUrlFromJson)
  final String? imageUrl;
  @override
  final String? date;
  @override
  @JsonKey(readValue: _readUrl)
  final String? url;

  @override
  String toString() {
    return 'DmmItem(contentId: $contentId, title: $title, imageUrl: $imageUrl, date: $date, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DmmItem &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contentId, title, imageUrl, date, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DmmItemCopyWith<_$_DmmItem> get copyWith =>
      __$$_DmmItemCopyWithImpl<_$_DmmItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DmmItemToJson(
      this,
    );
  }
}

abstract class _DmmItem implements DmmItem {
  const factory _DmmItem(
      {@JsonKey(name: 'content_id') final String contentId,
      final String title,
      @JsonKey(name: 'imageURL', fromJson: _imageUrlFromJson)
      final String? imageUrl,
      final String? date,
      @JsonKey(readValue: _readUrl) final String? url}) = _$_DmmItem;

  factory _DmmItem.fromJson(Map<String, dynamic> json) = _$_DmmItem.fromJson;

  @override
  @JsonKey(name: 'content_id')
  String get contentId;
  @override
  String get title;
  @override
  @JsonKey(name: 'imageURL', fromJson: _imageUrlFromJson)
  String? get imageUrl;
  @override
  String? get date;
  @override
  @JsonKey(readValue: _readUrl)
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_DmmItemCopyWith<_$_DmmItem> get copyWith =>
      throw _privateConstructorUsedError;
}
