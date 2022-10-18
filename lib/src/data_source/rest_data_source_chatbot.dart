import 'dart:convert';



import 'package:http/http.dart' as http;

import '../models/user_chatbot_model.dart';

class RestDataChatbot{

  static const String _baseUrl = '142.93.24.114';
  static const String _office = '/api/v2/oficina/';


  final http.Client _httpClient;


  RestDataChatbot({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();



  Future<T?> _callGetApi<T>({
    required String endpoint,
    required Map<String, String> params,
    required T Function(Map<String, dynamic> data) builder,
  }) async {
    try {

        var uri = Uri.http(_baseUrl, endpoint);
        var request = http.MultipartRequest('POST', uri)
          ..fields.addAll(params);
        var response = await request.send();

        if(response.statusCode==200)
        {
          final respStr = await response.stream.bytesToString();

          //final decoded = json.decode(respStr);
          final decoded = json.decode(respStr);
          print(
              decoded
          );
          if(decoded['message'][0]==null)
            {
              return builder(decoded['message']);
            }

          else
            {
              return builder(decoded['message'][0]);
            }




        }
        else
        {
          throw Exception('Fallo al traer datos');
        }






    }
    catch (e) {
      print(e);
    }
  }

  Future<Userchatbot?> getDataPS(String cedula) async
  {
    return _callGetApi(
      endpoint: _office,
      params: {'userapi':'int3rcomapp',
        'token':'\$2a\$07\$asxx54ahjppf45sd87a5auZt0EPrYa5GEpjxAHui4ZBPs3YUnSn0i',
        'comando':'lista-clientes',
        'documento': cedula},

      builder: (data) => Userchatbot.fromJson(data),
    );
  }


}