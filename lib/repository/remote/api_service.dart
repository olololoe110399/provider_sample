import 'package:http/http.dart';
import 'package:sample/config/app_constants.dart';

class ApiService {
  Client client = Client();

  Future<Response> request({
    required Method method,
    required String url,
  }) async {
    final fullUrl =
        '${AppConstants.baseUrl}/$url?${AppConstants.apiKey}=${AppConstants.apiKeyValue}';
    switch (method) {
      case Method.post:
        return client.post(Uri.parse(fullUrl));
      case Method.get:
        return client.get(Uri.parse(fullUrl));
      case Method.put:
        return client.put(Uri.parse(fullUrl));
      case Method.delete:
        return client.delete(Uri.parse(fullUrl));
      default:
        return client.get(Uri.parse(fullUrl));
    }
  }
}

enum Method { post, get, put, delete }
