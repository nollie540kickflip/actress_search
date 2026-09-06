import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState {
  final String apiId;
  final String affiliateId;
  final bool isLoaded;

  SettingsState({
    this.apiId = '',
    this.affiliateId = '',
    this.isLoaded = false,
  });

  SettingsState copyWith({
    String? apiId,
    String? affiliateId,
    bool? isLoaded,
  }) {
    return SettingsState(
      apiId: apiId ?? this.apiId,
      affiliateId: affiliateId ?? this.affiliateId,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  bool get isConfigured => apiId.isNotEmpty && affiliateId.isNotEmpty;
}

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier() : super(SettingsState()) {
    _loadSettings();
  }

  static const _apiIdKey = 'dmm_api_id';
  static const _affiliateIdKey = 'dmm_affiliate_id';

  Future<void> _loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final apiId = prefs.getString(_apiIdKey) ?? '';
      final affiliateId = prefs.getString(_affiliateIdKey) ?? '';
      state = state.copyWith(
        apiId: apiId,
        affiliateId: affiliateId,
        isLoaded: true,
      );
    } catch (e) {
      // SharedPreferencesエラー時のフォールバック
      state = state.copyWith(isLoaded: true);
    }
  }

  Future<void> saveSettings(String apiId, String affiliateId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_apiIdKey, apiId);
    await prefs.setString(_affiliateIdKey, affiliateId);
    state = state.copyWith(apiId: apiId, affiliateId: affiliateId);
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier();
});
