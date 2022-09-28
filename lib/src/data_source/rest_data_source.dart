import 'dart:convert';
import 'package:appintercom/src/models/user_finansys_model.dart';

import 'package:http/http.dart' as http;

class RestDataSource {
  //http://codgrec.finamsys.com:9969/api/v1.0/get_invoice_from_idc
  static const String _baseUrl = 'codgrec.finamsys.com:9969';
  static const String _name = '/api/v1.0/get_invoice_from_idc';

  //static const String _location = '/api';
  //static const String _picture = '/api';

  final http.Client _httpClient;

  RestDataSource({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<T> _callGetApi<T>({
    required String endpoint,
    required Map<String, dynamic> params,
    required T Function(Map<String, dynamic> data) builder,
  }) async {
    var uri = Uri.http(_baseUrl, endpoint);
    final body = json.encode(params);
    final response = await _httpClient
        .post((uri), body: body, headers: {'Content-Type': 'application/json'});
    final decoded = json.decode(response.body);
    return builder(decoded['messaje'][0]);
  }

  Future<UserFinansys> getName(String company, String idc) async {
    return _callGetApi(
      endpoint: _name,
      params: {'id_company': company, 'idc': idc},
      builder: (data) => UserFinansys.fromJson(data),
    );
  }
}