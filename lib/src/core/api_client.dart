import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

import 'api_constants.dart';
import 'unathorised_exception.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);


  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    _apiLogs(
      requestMethod: 'GET',
      api: await _getPath(path, params),
      headers: await _headers(),
    );

    final response = await _client.get(
      await _getPath(path, params),
      headers: await _headers(),
    ).timeout(const Duration(seconds: 30));

    await Future.delayed(const Duration(seconds: 2));

    _apiLogs(
        requestMethod: 'GET',
        api: await _getPath(path, params),
        headers: await _headers(),
        statusCode: response.statusCode,
        response: response.body
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if(response.statusCode == 504) {
      throw TimeoutException(response.reasonPhrase);
    }else if(response.statusCode == 403){
      throw UnauthorisedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<Uri> _getPath(String path, Map<dynamic, dynamic>? params) async{

    var paramsString = '';

    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return Uri.parse(
        '${ApiConstants.kBaseUrl}$path${paramsString.isNotEmpty ? "?$paramsString" : ""}');
  }

  Future<Map<String, String>> _headers() async{

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Desidime-Client': '08b4260e5585f282d1bd9d085e743fd9'
    };
  }

  void _apiLogs({String? requestMethod, Uri? api, Map<String, String>? headers, body, int? statusCode, String? response}) {
    if(requestMethod != null) {
      log('METHOD $requestMethod: ${api.toString()}');
    }
    if(headers != null) {
      log('HEADERS: $headers');
    }

    if(body != null)  {
      log('REQUEST_BODY: $body');
    }

    if(statusCode != null) {
      log('STATUS CODE: $statusCode');
    }

    if(response != null) {
      log('RESPONSE: $response');
    }
  }
}
