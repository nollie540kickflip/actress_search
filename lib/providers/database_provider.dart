import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/isar_service.dart';

final databaseProvider = Provider<IsarService>((ref) {
  return IsarService(); // isarService = IsarService(); await isarService.db; は runApp前に行うか、Provider側で非同期にするか
});
