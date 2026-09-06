import 'package:freezed_annotation/freezed_annotation.dart';

part 'dmm_item.freezed.dart';
part 'dmm_item.g.dart';

@freezed
class DmmItem with _$DmmItem {
  const factory DmmItem({
    @JsonKey(name: 'content_id') @Default('') String contentId,
    @Default('タイトル不明') String title,
    @JsonKey(name: 'imageURL', fromJson: _imageUrlFromJson) String? imageUrl,
    String? date,
    @JsonKey(readValue: _readUrl) String? url,
  }) = _DmmItem;

  factory DmmItem.fromJson(Map<String, dynamic> json) => _$DmmItemFromJson(json);
}

String? _imageUrlFromJson(dynamic json) {
  if (json is Map<String, dynamic> || json is Map<dynamic, dynamic>) {
    final map = Map<String, dynamic>.from(json as Map);
    return map['large'] as String? ?? map['list'] as String? ?? map['small'] as String?;
  }
  return null;
}

Object? _readUrl(Map<dynamic, dynamic> json, String key) {
  return json['affiliateURL'] ?? json['URL'];
}
