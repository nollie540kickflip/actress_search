import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_update_provider.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _apiIdController = TextEditingController();
  final _affiliateIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // 初期値のセット
    final settings = ref.read(settingsProvider);
    _apiIdController.text = settings.apiId;
    _affiliateIdController.text = settings.affiliateId;
  }

  @override
  void dispose() {
    _apiIdController.dispose();
    _affiliateIdController.dispose();
    super.dispose();
  }

  void _saveSettings() {
    if (_formKey.currentState!.validate()) {
      ref.read(settingsProvider.notifier).saveSettings(
            _apiIdController.text.trim(),
            _affiliateIdController.text.trim(),
          );
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('設定を保存しました')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final updateState = ref.watch(databaseUpdateProvider);
    final updateNotifier = ref.read(databaseUpdateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- DMM API設定セクション ---
            const Text(
              'DMM API設定',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '女優データを取得するためにDMM API IDとアフィリエイトIDが必要です。',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _apiIdController,
                    decoration: const InputDecoration(
                      labelText: 'API ID',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.key),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'API IDを入力してください';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _affiliateIdController,
                    decoration: const InputDecoration(
                      labelText: 'アフィリエイト ID',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.link),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'アフィリエイト IDを入力してください';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _saveSettings,
                      child: const Text('APIキーを保存'),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 32),

            // --- データベース管理セクション ---
            const Text(
              'データベース管理',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: (!ref.watch(settingsProvider).isConfigured || updateState.isUpdating)
                  ? null
                  : () {
                      updateNotifier.fetchAndSaveAllActresses();
                    },
              icon: updateState.isUpdating
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.sync),
              label: Text(
                updateState.isUpdating ? '更新中...' : '女優データを全件取得・更新',
              ),
            ),
            const SizedBox(height: 16),
            if (updateState.statusMessage.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(updateState.statusMessage),
                    if (updateState.isUpdating && updateState.totalCount > 0) ...[
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: updateState.currentCount / updateState.totalCount,
                      ),
                    ]
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
