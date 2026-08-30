import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/actress.dart';
import '../models/sort_order.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [ActressSchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  // バルクインサート（一括更新）。新規データがあった場合は true を返す
  Future<bool> saveActresses(List<Actress> actresses) async {
    final isar = await db;
    
    // 既存データをDMM IDで取得
    final dmmIds = actresses.map((a) => a.dmmId).whereType<int>().toList();
    final existingActresses = await isar.actress.filter().anyOf(dmmIds, (q, int id) => q.dmmIdEqualTo(id)).findAll();
    final existingMap = {for (var a in existingActresses) a.dmmId: a};

    bool hasNewData = false;

    for (var actress in actresses) {
      final existing = existingMap[actress.dmmId];
      if (existing != null) {
        actress.id = existing.id; // Isarの内部IDを引き継いでUpdateにする
        actress.isFavorite = existing.isFavorite; // お気に入り状態を引き継ぐ
      } else {
        hasNewData = true; // DBに存在しない新規データが含まれていた
      }
    }

    await isar.writeTxn(() async {
      await isar.actress.putAll(actresses);
    });

    return hasNewData;
  }

  // お気に入りの切り替え
  Future<void> toggleFavorite(Id id, bool isFavorite) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final actress = await isar.actress.get(id);
      if (actress != null) {
        actress.isFavorite = isFavorite;
        await isar.actress.put(actress);
      }
    });
  }

  // 検索・絞り込み・並び替え
  Future<List<Actress>> searchActresses({
    String query = '',
    int? minBust,
    SortOrder sortOrder = SortOrder.rubyAsc,
    bool onlyFavorites = false,
  }) async {
    final isar = await db;
    
    // 全データ取得か、検索条件付きのクエリビルダを作成
    QueryBuilder<Actress, Actress, QAfterFilterCondition> filterQuery = isar.actress.filter().idGreaterThan(-1); // dummy filter to start chain

    if (query.isNotEmpty) {
      filterQuery = filterQuery.nameContains(query);
    }
    
    if (minBust != null) {
      filterQuery = filterQuery.bustGreaterThan(minBust - 1);
    }
    
    if (onlyFavorites) {
      filterQuery = filterQuery.isFavoriteEqualTo(true);
    }

    // 並び替えの適用
    if (sortOrder == SortOrder.birthDateDesc) {
      return await filterQuery.sortByBirthDateDesc().findAll();
    } else if (sortOrder == SortOrder.birthDateAsc) {
      return await filterQuery.sortByBirthDate().findAll();
    } else {
      return await filterQuery.sortByRuby().findAll();
    }
  }

  // データ全件削除（必要に応じて）
  Future<void> clearAll() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.actress.clear();
    });
  }
}
