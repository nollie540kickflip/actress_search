import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/home_state_provider.dart';
import '../providers/settings_provider.dart';
import 'settings_screen.dart';
import '../widgets/home_filters.dart';
import '../widgets/actress_list_tile.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeStateProvider);
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('女優検索'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
              // 設定画面から戻ったとき、DBが更新されている可能性があるため再検索
              ref.read(homeStateProvider.notifier).fetchData();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (!settings.isConfigured && settings.isLoaded)
            Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.errorContainer,
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.warning, color: Theme.of(context).colorScheme.onErrorContainer),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'APIキーが未設定です。右上の設定ボタンから設定してください。',
                      style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
                    ),
                  ),
                ],
              ),
            ),
          const HomeFilters(),
          if (!homeState.isLoading)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '検索結果: ${homeState.actresses.length}件',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          Expanded(
            child: homeState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : homeState.actresses.isEmpty
                    ? const Center(child: Text('データが見つかりません。設定から更新してください。'))
                    : ListView.builder(
                        itemCount: homeState.actresses.length,
                        itemBuilder: (context, index) {
                          final actress = homeState.actresses[index];
                          return ActressListTile(actress: actress);
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
