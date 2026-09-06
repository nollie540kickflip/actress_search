// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dmm_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DmmItem _$$_DmmItemFromJson(Map<String, dynamic> json) => _$_DmmItem(
      contentId: json['content_id'] as String? ?? '',
      title: json['title'] as String? ?? 'タイトル不明',
      imageUrl: _imageUrlFromJson(json['imageURL']),
      date: json['date'] as String?,
      url: _readUrl(json, 'url') as String?,
    );

Map<String, dynamic> _$$_DmmItemToJson(_$_DmmItem instance) =>
    <String, dynamic>{
      'content_id': instance.contentId,
      'title': instance.title,
      'imageURL': instance.imageUrl,
      'date': instance.date,
      'url': instance.url,
    };
