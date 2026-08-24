import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database_provider.dart';
import 'api_provider.dart';
import '../services/api_exception.dart';

class DatabaseUpdateState {
  final bool isUpdating;
  final int currentCount;
  final int totalCount;
  final String statusMessage;

  DatabaseUpdateState({
    this.isUpdating = false,
    this.currentCount = 0,
    this.totalCount = 0,
    this.statusMessage = '',
  });

  DatabaseUpdateState copyWith({
    bool? isUpdating,
    int? currentCount,
    int? totalCount,
    String? statusMessage,
  }) {
    return DatabaseUpdateState(
      isUpdating: isUpdating ?? this.isUpdating,
      currentCount: currentCount ?? this.currentCount,
      totalCount: totalCount ?? this.totalCount,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }
}

class DatabaseUpdateNotifier extends StateNotifier<DatabaseUpdateState> {
  final Ref ref;

  DatabaseUpdateNotifier(this.ref) : super(DatabaseUpdateState());

  Future<void> fetchAndSaveAllActresses() async {
    if (state.isUpdating) return;

    state = state.copyWith(
      isUpdating: true,
      currentCount: 0,
      totalCount: 0,
      statusMessage: '更新を開始しています...',
    );

    final apiClient = ref.read(apiProvider);
    final dbService = ref.read(databaseProvider);

    const int hits = 100;
    int offset = 1;
    int totalCount = 0;
    int currentCount = 0;
    bool hasNext = true;
    int retryCount = 0;
    const int maxRetries = 30; // バックグラウンド復帰を考慮して少し長めに待機可能にする

    while (hasNext) {
      try {
        final actressesToSave = await apiClient.fetchActresses(offset, hits);

        if (totalCount == 0) {
          totalCount = await apiClient.fetchTotalCount();
        }

        if (actressesToSave.isNotEmpty) {
          final hasNewData = await dbService.saveActresses(actressesToSave);

          currentCount += actressesToSave.length;

          state = state.copyWith(
            currentCount: currentCount,
            totalCount: totalCount,
            statusMessage: '現在 $currentCount件 / $totalCount件を取得中...',
          );

          offset += hits;
          retryCount = 0; // 成功した場合はリトライ回数をリセット

          if (!hasNewData) {
            // 新規データが一件もなかった場合（既存データに追いついた場合）、差分更新を終了
            hasNext = false;
          } else if (currentCount >= totalCount) {
            hasNext = false;
          } else {
            await Future.delayed(const Duration(milliseconds: 100));
          }
        } else {
          // データがない場合は終了とみなす
          hasNext = false;
        }
      } on ApiException catch (e) {
        if (e.type == ApiErrorType.unauthorized) {
          state = state.copyWith(
            isUpdating: false,
            statusMessage: 'エラーが発生しました:\n${e.message}\n設定画面から正しいAPIキーを設定してください。',
          );
          return;
        }
        retryCount++;
        if (retryCount >= maxRetries) {
          state = state.copyWith(
            isUpdating: false,
            statusMessage: 'エラーが発生しました:\n${e.message}',
          );
          return;
        }
        state = state.copyWith(
          statusMessage: 'エラーのため再試行中... ($retryCount/$maxRetries)\nバックグラウンドから復帰するまで待機します。',
        );
        await Future.delayed(const Duration(seconds: 5));
      } catch (e) {
        retryCount++;
        if (retryCount >= maxRetries) {
          state = state.copyWith(
            isUpdating: false,
            statusMessage: 'エラーが発生しました:\n予期せぬエラーのため中断しました。',
          );
          return;
        }
        state = state.copyWith(
          statusMessage: '通信エラーのため再試行中... ($retryCount/$maxRetries)\nバックグラウンドから復帰するまで待機します。',
        );
        await Future.delayed(const Duration(seconds: 5));
      }
    }

    // 正常完了時
    if (!state.isUpdating) return; // 途中でエラー中断していればスキップ

    state = state.copyWith(
      isUpdating: false,
      statusMessage: '更新が完了しました！\n最新のデータを $currentCount 件確認・保存しました。',
    );
  }
}

final databaseUpdateProvider =
    StateNotifierProvider<DatabaseUpdateNotifier, DatabaseUpdateState>((ref) {
      return DatabaseUpdateNotifier(ref);
    });
