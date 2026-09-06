# DMM Actress Search App - 開発者向けドキュメント

このドキュメントでは、アプリの開発・ビルドに関する情報をまとめています。
アプリの一般的な使い方やインストール方法については [README.md](README.md) をご覧ください。

## 技術スタック / 採用パッケージ
- **Flutter / Dart** (SDK: ^3.1.0)
- **状態管理・DI**: [Riverpod (flutter_riverpod)](https://pub.dev/packages/flutter_riverpod)
  - アプリ全体の状態管理と依存性注入に利用しています。
- **ローカルデータベース**: [Isar (isar, isar_flutter_libs)](https://pub.dev/packages/isar)
  - NoSQLの高速なローカルDB。`build_runner` を使用してスキーマコードを自動生成します。
- **API通信**: [http](https://pub.dev/packages/http)
- **データモデル**: [Freezed (freezed, json_serializable)](https://pub.dev/packages/freezed)
  - 不変なデータモデルと状態クラスの生成、APIレスポンスのパースに利用しています。
- **ローカル認証**: [local_auth](https://pub.dev/packages/local_auth)
  - アプリ起動時のロック機能（生体認証など）に利用しています。
- **ローカル設定保存**: [shared_preferences](https://pub.dev/packages/shared_preferences)
- **外部ブラウザ起動**: [url_launcher](https://pub.dev/packages/url_launcher)

## アーキテクチャとディレクトリ構成

このプロジェクトは保守性を高めるため、UI（View）とビジネスロジック（Provider）を分離した設計になっています。

```text
lib/
 ├── main.dart                  # アプリのエントリーポイント（ProviderScopeの初期化）
 ├── models/                    # データモデル定義
 │    ├── actress.dart          # 女優モデル（Isarスキーマ定義）
 │    ├── actress.g.dart        # Isarの自動生成コード（編集不可）
 │    ├── dmm_item.dart         # 作品情報のモデル（Freezed）
 │    ├── dmm_item.freezed.dart # Freezedの自動生成コード
 │    ├── dmm_item.g.dart       # JSON Serializableの自動生成コード
 │    └── sort_order.dart       # 並び替え用の列挙型
 ├── providers/                 # Riverpodのプロバイダー（状態管理・DI）
 │    ├── api_provider.dart     # DMM APIとの通信インスタンスを提供
 │    ├── database_provider.dart# IsarのDBインスタンスを提供
 │    ├── database_update_provider.dart # DB一括更新ロジックと進捗状態を管理
 │    ├── home_state_provider.dart      # ホーム画面の検索条件と女優リストを管理（Freezed）
 │    ├── home_state_provider.freezed.dart # 状態クラスの自動生成コード
 │    └── settings_provider.dart        # APIキーなどの設定を管理
 ├── screens/                   # UI層 (ConsumerWidget)
 │    ├── auth_screen.dart      # 認証・ロック画面
 │    ├── home_screen.dart      # ホーム画面（一覧・検索・絞り込み）
 │    ├── detail_screen.dart    # 女優詳細画面・最新作品一覧
 │    └── settings_screen.dart  # 設定画面（DB更新・APIキー設定）
 ├── widgets/                   # 再利用可能なUIコンポーネント
 │    ├── actress_list_tile.dart
 │    ├── home_filters.dart
 │    ├── info_row.dart
 │    └── latest_items_section.dart
 └── services/                  # 外部連携や永続化のインフラ層
      ├── api_exception.dart    # API通信エラー定義
      ├── api_service.dart      # DMM APIとの通信処理
      └── isar_service.dart     # Isar データベースの操作ロジック
```

## 開発環境のセットアップ

### 1. パッケージのインストール
```bash
flutter pub get
```

### 2. コード生成（IsarやFreezedモデルの変更時）
`lib/models/actress.dart` などのIsarスキーマや、`dmm_item.dart` などのFreezedモデルを変更した場合は、以下のコマンドを実行してコードを再生成する必要があります。

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 3. アプリの起動
```bash
flutter run
```

## 既知の問題 / トラブルシューティング
- **url_launcher の `component name for ... is null` エラーについて**
  Androidエミュレーターでブラウザアプリ（Chrome等）がインストールされていない場合、商品URLをタップしても開けないことがあります。実機、またはChromeがインストールされたエミュレーターでお試しください。
- **Androidビルドエラー (`compileSdk` 関連)**
  本アプリは `url_launcher` などの都合により `compileSdk 36` 以上を要求します。エラーが出た場合は `android/app/build.gradle.kts` および `android/build.gradle.kts` の設定を確認してください。
