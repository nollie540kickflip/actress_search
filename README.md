# DMM Actress Search App

DMM APIを使用して女優データを検索し、お気に入り管理などを行うFlutter(Android)アプリです。オフラインでも動作を軽くするため、取得したデータはすべてローカルデータベース（Isar）に保存し、検索・閲覧を素早く行えるように設計されています。

## アプリの主な機能
- **データ一括取得**: DMM APIから数万件の女優データをローカルデータベースに同期します。
- **高速検索とフィルタリング**: 名前での検索、バストサイズの絞り込み、生年月日の並び替えが可能です。
- **お気に入り機能**: 気になる女優をお気に入り登録し、一覧で絞り込んで表示できます。
- **最新出演作品の表示**: 女優の詳細画面で、最新の出演作品（最大10件）のパッケージ画像と商品URLを確認できます。

## 技術スタック / 採用パッケージ
- **Flutter / Dart** (SDK: 3.13.0+)
- **状態管理・DI**: [Riverpod (flutter_riverpod)](https://pub.dev/packages/flutter_riverpod)
  - アプリ全体の状態管理と依存性注入に利用しています。
- **ローカルデータベース**: [Isar (isar, isar_flutter_libs)](https://pub.dev/packages/isar)
  - NoSQLの高速なローカルDB。`build_runner` を使用してスキーマコードを自動生成します。
- **API通信**: [http](https://pub.dev/packages/http)
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
 │    └── dmm_item.dart         # 作品情報のモデル
 ├── providers/                 # Riverpodのプロバイダー（状態管理・DI）
 │    ├── api_provider.dart     # DMM APIとの通信インスタンスを提供
 │    ├── database_provider.dart# IsarのDBインスタンスを提供
 │    ├── database_update_provider.dart # DB一括更新ロジックと進捗状態を管理
 │    └── home_state_provider.dart      # ホーム画面の検索条件と女優リストを管理
 ├── screens/                   # UI層 (ConsumerWidget)
 │    ├── home_screen.dart      # ホーム画面（一覧・検索・絞り込み）
 │    ├── detail_screen.dart    # 女優詳細画面・最新作品一覧
 │    └── settings_screen.dart  # 設定画面（DB更新・APIキー設定）
 ├── widgets/                   # 再利用可能なUIコンポーネント
 │    ├── actress_list_tile.dart
 │    ├── home_filters.dart
 │    ├── info_row.dart
 │    └── latest_items_section.dart
 └── services/                  # 外部連携や永続化のインフラ層
      ├── api_service.dart      # DMM APIとの通信処理
      └── isar_service.dart     # Isar データベースの操作ロジック
```

## 開発環境のセットアップ

### 1. 事前準備（DMM APIキーの取得）
このアプリを使用するには、DMMのWebサービスを利用するためのAPIキーが必要です。
事前に[DMMアフィリエイト](https://affiliate.dmm.com/)などのデベロッパー向けページから、以下の2つを取得しておいてください。
- **API ID**
- **アフィリエイト ID**

※取得したキーはソースコードに直接書き込まず、アプリ起動後にアプリ内の「設定画面」から入力して安全にローカル保存する仕組みになっています。

### 2. パッケージのインストール
```bash
flutter pub get
```

### 3. コード生成（Isarモデルの変更時）
`lib/models/actress.dart` のスキーマ（プロパティなど）を変更した場合は、以下のコマンドを実行して `actress.g.dart` を再生成する必要があります。

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. アプリの起動
```bash
flutter run
```

## 既知の問題 / トラブルシューティング
- **url_launcher の `component name for ... is null` エラーについて**
  Androidエミュレーターでブラウザアプリ（Chrome等）がインストールされていない場合、商品URLをタップしても開けないことがあります。実機、またはChromeがインストールされたエミュレーターでお試しください。
- **Androidビルドエラー (`compileSdk` 関連)**
  本アプリは `url_launcher` などの都合により `compileSdk 36` 以上を要求します。エラーが出た場合は `android/app/build.gradle.kts` および `android/build.gradle.kts` の設定を確認してください。
