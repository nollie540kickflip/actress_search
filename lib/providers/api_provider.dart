import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';
import 'settings_provider.dart';

final apiProvider = Provider<DmmApiClient>((ref) {
  final settings = ref.watch(settingsProvider);
  return DmmApiClient(
    apiId: settings.apiId,
    affiliateId: settings.affiliateId,
  );
});
