import 'package:isar/isar.dart';

part 'actress.g.dart';

@collection
class Actress {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  int? dmmId;

  @Index(type: IndexType.value)
  String? name;

  @Index()
  int? bust;

  @Index()
  DateTime? birthDate;

  String? ruby;
  String? imageUrl;
  int? waist;
  int? hip;
  String? height;

  @Index()
  bool isFavorite = false;

  Actress();

  factory Actress.fromJson(Map<String, dynamic> json) {
    final actress = Actress()
      ..dmmId = int.tryParse(json['id'].toString())
      ..name = json['name']
      ..ruby = json['ruby']
      ..bust = int.tryParse(json['bust'].toString())
      ..waist = int.tryParse(json['waist'].toString())
      ..hip = int.tryParse(json['hip'].toString())
      ..height = json['height']?.toString();

    // 生年月日のパース
    if (json['birthday'] != null && json['birthday'].toString().isNotEmpty) {
      try {
        actress.birthDate = DateTime.parse(json['birthday']);
      } catch (e) {
        // パース失敗時はnullのまま
      }
    }

    if (json['imageURL'] != null) {
      final images = json['imageURL'] as Map<String, dynamic>;
      actress.imageUrl = images['large'] ?? images['small'];
    }
    
    return actress;
  }
}
