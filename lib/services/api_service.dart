import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/actress.dart';
import '../models/dmm_item.dart';
import 'api_exception.dart';

class DmmApiClient {
  final String apiId;
  final String affiliateId;

  DmmApiClient({required this.apiId, required this.affiliateId});

  Future<dynamic> _get(String urlString) async {
    if (apiId.isEmpty || affiliateId.isEmpty) {
      throw ApiException(
        type: ApiErrorType.unauthorized,
        message: 'API IDまたはアフィリエイトIDが設定されていません',
      );
    }
    
    try {
      final url = Uri.parse(urlString);
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 400 || response.statusCode == 401) {
        throw ApiException(
          type: ApiErrorType.unauthorized,
          message: 'APIキーが不正か、リクエストが無効です',
          statusCode: response.statusCode,
        );
      } else if (response.statusCode >= 500) {
        throw ApiException(
          type: ApiErrorType.server,
          message: 'DMMサーバーでエラーが発生しました',
          statusCode: response.statusCode,
        );
      } else {
        throw ApiException(
          type: ApiErrorType.unknown,
          message: '予期せぬエラーが発生しました',
          statusCode: response.statusCode,
        );
      }
    } on SocketException catch (_) {
      throw ApiException(
        type: ApiErrorType.network,
        message: 'ネットワークに接続できません。通信環境を確認してください',
      );
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException(
        type: ApiErrorType.unknown,
        message: 'エラーが発生しました: $e',
      );
    }
  }

  Future<List<Actress>> fetchActresses(int offset, int hits) async {
    final data = await _get(
        'https://api.dmm.com/affiliate/v3/ActressSearch?api_id=$apiId&affiliate_id=$affiliateId&output=json&offset=$offset&hits=$hits&sort=-id');
    final result = data['result'];
    final List<dynamic> actressesJson = result['actress'] ?? [];
    return actressesJson.map((json) => Actress.fromJson(json)).toList();
  }

  Future<int> fetchTotalCount() async {
    final data = await _get(
        'https://api.dmm.com/affiliate/v3/ActressSearch?api_id=$apiId&affiliate_id=$affiliateId&output=json&offset=1&hits=1');
    final result = data['result'];
    return int.tryParse(result['total_count']?.toString() ?? '') ?? 0;
  }

  // 女優の最新出演作品を取得する
  Future<List<DmmItem>> fetchLatestItems(int actressId) async {
    final data = await _get(
        'https://api.dmm.com/affiliate/v3/ItemList?api_id=$apiId&affiliate_id=$affiliateId&site=FANZA&article=actress&article_id=$actressId&sort=date&hits=10&output=json');
    final result = data['result'];
    if (result['status'] != 200) {
      return [];
    }
    final List<dynamic> itemsJson = result['items'] ?? [];
    return itemsJson.map((json) => DmmItem.fromJson(json)).toList();
  }
}
