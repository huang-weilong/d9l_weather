import 'package:dio/dio.dart';

class Http {
  static final Http _httpClient = Http._internal();
  // static Http get instance => _httpClient;
  factory Http() => _httpClient;
  Http._internal() {
    _init();
  }

  late Dio _dio;

  void _init() {
    _dio = Dio(BaseOptions(connectTimeout: 60000, receiveTimeout: 15000, sendTimeout: 15000));
    _dio.options.baseUrl = rootUrl;
  }

  static final String rootUrl = 'https://free-api.heweather.net/s6';
  static final String key = 'd77fe2f561f44c1b8a8d365ad503e9bf';

  Future get(String path, Map<String, dynamic>? params) async {
    try {
      Response response = await _dio.get(path, queryParameters: params);
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future post(String path, Map<String, dynamic> data) async {
    try {
      Response response = await _dio.post(path, data: data);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
