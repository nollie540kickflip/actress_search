# DMM Actress Search App

DMM APIを使用して女優データを検索し、お気に入り管理などを行うFlutter(Android)アプリです。オフラインでも動作を軽くするため、取得したデータはすべてローカルデータベース（Isar）に保存し、検索・閲覧を素早く行えるように設計されています。



## アプリの主な機能
- **起動時のロック機能**: `local_auth` を使用した生体認証（FaceID/TouchID）やパスコード等でアプリを保護します。
- **データ一括取得**: DMM APIから数万件の女優データをローカルデータベースに同期します。
- **高速検索とフィルタリング**: 名前での検索、バストサイズの絞り込み、生年月日の並び替えが可能です。
- **お気に入り機能**: 気になる女優をお気に入り登録し、一覧で絞り込んで表示できます。
- **最新出演作品の表示**: 女優の詳細画面で、最新の出演作品（最大10件）のパッケージ画像と商品URLを確認できます。

## アプリの使い方

本アプリを初めて利用する際は、APIキーの設定とデータの同期が必要です。

### 1. APIキーの設定とデータの取得
<img src="assets/screenshots/settings.png" width="250" align="right">
アプリを起動後、右下のタブなどから「設定画面」を開きます。
事前に取得した **DMM API ID** と **アフィリエイト ID** を入力し、「APIキーを保存」をタップして安全に保存します。
保存が完了したら、すぐ下にある「女優データを全件取得・更新」ボタンを押して、ローカルデータベースにデータを同期してください。
初回起動時はデータがないため、この操作が必須となります。
<br clear="all">

### 2. 女優の検索と詳細表示
<img src="assets/screenshots/home.png" width="250" align="right">
トップ画面（ホーム画面）では、取得した女優データが一覧で表示されます。
- **検索と絞り込み**: 画面上部の検索バーから名前（ひらがな・漢字）で検索したり、フィルターを使って生年月日順やバストサイズなどで絞り込むことができます。
- **お気に入り管理**: 各女優のハートマークをタップするとお気に入りに登録され、一覧画面のフィルターから「お気に入りのみ」を表示できます。
- **詳細情報の確認**: リストの女優をタップすると詳細画面へ移動し、プロフィール情報や最新の出演作品をパッケージ画像とともに確認できます。
<br clear="all">

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

### 3. コード生成（IsarやFreezedモデルの変更時）
`lib/models/actress.dart` などのIsarスキーマや、`dmm_item.dart` などのFreezedモデルを変更した場合は、以下のコマンドを実行してコードを再生成する必要があります。

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
