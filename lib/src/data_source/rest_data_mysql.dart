import 'dart:convert';
import 'package:appintercom/src/models/user_finansys_model.dart';
import 'package:appintercom/src/models/user_mysql_model.dart';

import 'package:http/http.dart' as http;

class RestDataSourceMySql {
  static const String _baseUrl = 'app.intercom.ec';
  static const String _name = '/data/usuarios';

  final http.Client _httpClient;

  RestDataSourceMySql({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<T> _callGetApi<T>({
    required String endpoint,
    required Map<String, dynamic> params,
    required T Function(Map<String, dynamic> data) builder,
  }) async {
    var uri = Uri.https(_baseUrl, endpoint, params);
    print(uri);
    //final body = json.encode(params);
    final response = await _httpClient.get((uri));
    final decoded = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(decoded);
    print(jsonData[0]);
    return builder(jsonData[0]);
  }

  Future<UserMysql> getName(String uid) async {
    return _callGetApi(
      endpoint: _name,
      params: {'uid': uid},
      builder: (data) => UserMysql.fromJson(data),
    );
  }
}
