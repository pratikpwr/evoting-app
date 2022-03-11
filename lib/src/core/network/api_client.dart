import 'package:dio/dio.dart';

enum HttpMethod { GET, POST, PUT, DELETE }

/// This class provides http calls using dio package
class ApiClient {
  final Dio _dio = Dio();

  @override
  Future<Response> request(
    HttpMethod method,
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    dynamic body,
  }) async {
    // we can add headers here which are common for every restapi call
    // headers = {'content-type': 'application/json'};

    final _response = await _dio.request(
      path,
      options: Options(
        method: _getApiMethodString(method),
        headers: headers,
      ),
      queryParameters: queryParams,
      data: body,
    );
    return _response;
  }

  String _getApiMethodString(HttpMethod method) {
    switch (method) {
      case HttpMethod.GET:
        return 'GET';
      case HttpMethod.POST:
        return 'POST';
      case HttpMethod.PUT:
        return 'PUT';
      case HttpMethod.DELETE:
        return 'DELETE';
    }
  }
}
