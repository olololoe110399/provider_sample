import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:sample/config/app_constants.dart';
import 'package:sample/repository/remote/error/app_exception.dart';

abstract class ApiService {
  Client client = Client();

  Future<Map<String, dynamic>> request({
    required Method method,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final fullUrl =
          '${AppConstants.baseUrl}/$url?${AppConstants.apiKey}=${AppConstants.apiKeyValue}';
      final baseHeaders = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      };
      if (headers != null) {
        baseHeaders.addAll(headers);
      }
      switch (method) {
        case Method.post:
          final response = await client.post(
            Uri.parse(fullUrl),
            body: jsonEncode(body),
            headers: baseHeaders,
          );
          return Future.value(_response(response));
        case Method.get:
          final response = await client.get(
            Uri.parse(fullUrl),
            headers: baseHeaders,
          );
          return Future.value(_response(response));
        case Method.put:
          final response = await client.put(
            Uri.parse(fullUrl),
            headers: baseHeaders,
            body: jsonEncode(body),
          );
          return Future.value(_response(response));
        case Method.delete:
          final response = await client.delete(
            Uri.parse(fullUrl),
            headers: baseHeaders,
            body: jsonEncode(body),
          );
          return Future.value(_response(response));
      }
    } on SocketException {
      throw FetchDataException('No Internet connect');
    }
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Something error: ${response.statusCode}');
    }
  }
}

enum Method { post, get, put, delete }
